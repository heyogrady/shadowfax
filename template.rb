REQUIRED_RAILS_VERSION = "~> 5.0.0"

def apply_template!
  check_rails_version
  verify_all_options_are_valid
  verify_db_is_postgres
  add_shadowfax_repo_to_source_path

  template "Gemfile.tt", force: true

  template "DEPLOYMENT.md.tt"
  template "PROVISIONING.md.tt"
  template "README.md.tt", force: true
  remove_file "README.rdoc"

  template "example.env.tt"
  template "app.json.tt", "app.json"
  template "circle.yml.tt", "circle.yml"
  copy_file "codeclimate.yml", ".codeclimate.yml"
  copy_file "csslintrc", ".csslintrc"
  copy_file "eslintignore", ".eslintignore"
  copy_file "eslintrc", ".eslintrc"
  copy_file "gitignore", ".gitignore", force: true
  copy_file "jshintrc", ".jshintrc"
  copy_file "overcommit.yml", ".overcommit.yml"
  copy_file "pryrc", ".pryrc"
  copy_file "rubocop.yml", ".rubocop.yml"
  template "ruby-version.tt", ".ruby-version", force: true
  copy_file "simplecov", ".simplecov"

  copy_file "Capfile"
  copy_file "Guardfile"
  copy_file "Procfile"

  remove_dir "vendor"

  apply "app/template.rb"
  apply "bin/template.rb"
  apply "config/template.rb"
  apply "db/template.rb"
  apply "doc/template.rb"
  apply "lib/template.rb"
  apply "public/template.rb"
  apply "test/template.rb"

  apply "variants/bootstrap/template.rb" if apply_bootstrap?

  git :init unless preexisting_git_repo?
  empty_directory ".git/safe"

  run_with_clean_bundler_env "bin/setup"
  generate_spring_binstubs

  binstubs = %w(
    annotate
    brakeman
    bundler-audit
    capistrano
    guard
    rollbar
    rubocop
    terminal-notifier
  )
  run_with_clean_bundler_env "bundle binstubs #{binstubs.join(' ')}"
  run_rubocop_autocorrections

  unless preexisting_git_repo?
    git add: "-A ."
    git commit: "-n -m 'Set up project'"
    if git_repo_specified?
      git remote: "add origin #{git_repo_url.shellescape}"
      git push: "-u origin --all"
    end
  end
end

require "fileutils"
require "shellwords"

# Add this template directory to source_paths so that Thor actions like
# copy_file and template resolve against our source files. If this file was
# invoked remotely via HTTP, that means the files are not present locally.
# In that case, use `git clone` to download them to a local temporary dir.
def add_shadowfax_repo_to_source_path
  if __FILE__ =~ %r{\Ahttps?://}
    source_paths.unshift(tempdir = Dir.mktmpdir("rails-template-"))
    at_exit { FileUtils.remove_entry(tempdir) }
    git :clone => [
      "--quiet",
      "https://github.com/heyogrady/shadowfax.git",
      tempdir
    ].map(&:shellescape).join(" ")
  else
    source_paths.unshift(File.dirname(__FILE__))
  end
end

def check_rails_version
  required_version = Gem::Requirement.new(REQUIRED_RAILS_VERSION)
  current_version = Gem::Version.new(Rails::VERSION::STRING)
  return if required_version.satisfied_by?(current_version)

  prompt = "This template require Rails #{REQUIRED_RAILS_VERSION}. "\
           "You are using #{current_version}. Continue anyway?"
  exit 1 if no?(prompt)
end

def verify_all_options_are_valid
  valid_options = {
    skip_gemfile: false,
    skip_bundle: false,
    skip_git: false,
    skip_test_unit: false,
    edge: false
  }
  valid_options.each do |key, expected|
    next unless options.key?(key)
    actual = options[key]
    unless actual == expected
      fail Rails::Generators::Error, "Unsupported option: #{key}=#{actual}"
    end
  end
end

def verify_db_is_postgres
  return if IO.read("Gemfile") =~ /^\s*gem ['"]pg['"]/
  fail(
    Rails::Generators::Error,
    "This template requires PostgreSQL, but the pg gem isn't present in your Gemfile"
  )
end

# Mimic the convention used by capistrano-mb in order to generate
# accurate deployment documentation.
def capistrano_app_name
  app_name.gsub(/[^a-zA-Z0-9_]/, "_")
end

def git_repo_url
  @git_repo_url ||=
    ask_with_default("What is the git remote URL for this project?", :blue, "skip")
end

def production_hostname
  @production_hostname ||=
    ask_with_default("Production hostname?", :blue, "example.com")
end

def staging_hostname
  @staging_hostname ||=
    ask_with_default("Staging hostname?", :blue, "#{app_name}-staging.herokuapp.com")
end

def gemfile_requirement(name)
  @original_gemfile ||= IO.read("Gemfile")
  req = @original_gemfile[/gem\s+['"]#{name}['"]\s*(,[><~= \t\d\.\w'"]*)?.*$/, 1]
  req && req.gsub("'", %(")).strip.sub(/^,\s*"/, ', "')
end

def ask_with_default(question, color, default)
  return default unless $stdin.tty?
  question = (question.split("?") << " [#{default}]?").join
  answer = ask(question, color)
  answer.to_s.strip.empty? ? default : answer
end

def git_repo_specified?
  git_repo_url != "skip" && !git_repo_url.strip.empty?
end

def preexisting_git_repo?
  @preexisting_git_repo ||= (File.exist?(".git") || :nope)
  @preexisting_git_repo == true
end

def apply_bootstrap?
  ask_with_default("Use Bootstrap gems, layouts, views, etc.?", :blue, "no")\
    =~ /^y(es)?/i
end

def run_with_clean_bundler_env(cmd)
  return run(cmd) unless defined?(Bundler)
  Bundler.with_clean_env { run(cmd) }
end

def run_rubocop_autocorrections
  run_with_clean_bundler_env "bin/rubocop -a --fail-level A > /dev/null"
end

apply_template!
