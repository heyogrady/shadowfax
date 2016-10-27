apply "config/application.rb"
copy_file "config/brakeman.yml"
copy_file "config/database.example.yml"
copy_file "config/database.yml.ci"
copy_file "config/puma.rb", force: true
template "config/rubocop.yml.tt"
copy_file "config/rubocop-hound.yml", "config/.rubocop-hound.yml"
copy_file "config/javascript_ignore", "config/.javascript_ignore"
copy_file "config/jshint.json", "config/.jshint.json"
copy_file "config/secrets.yml", force: true

gsub_file "config/secrets.yml", /shadowfax_app_name/, "#{app_name}"
gsub_file "config/secrets.yml", /shadowfax_outgoing_emails_prefix/, "#{app_name.upcase}"
gsub_file "config/secrets.yml", /shadowfax_support_email/, "support@#{production_hostname}"

gsub_file "config/secrets.yml", /shadowfax-staging/, "#{app_name}-staging"
gsub_file "config/secrets.yml", /shadowfax_production_host/, "#{production_hostname}"
gsub_file "config/secrets.yml", /shadowfax_staging_host/, "#{staging_hostname}"


remove_file "config/database.yml"

template "config/deploy.rb.tt"
template "config/deploy/production.rb.tt"
template "config/deploy/staging.rb.tt"

insert_into_file "config/boot.rb", after: %r{bundler/setup.*\n} do
  'require "bootscale/setup"'

end

empty_directory_with_keep_file "config/routes"
copy_file "config/routes.rb", force: true

copy_file "config/initializers/active_admin.rb"
copy_file "config/initializers/active_job.rb"
copy_file "config/initializers/analytics_ruby.rb"
copy_file "config/initializers/asset_precompile.rb"
copy_file "config/initializers/bullet.rb"
copy_file "config/initializers/carrierwave.rb"
copy_file "config/initializers/delayed_job_config.rb"
copy_file "config/initializers/delayed_job_invoke_worker_automatically.rb"
copy_file "config/initializers/devise.rb"
copy_file "config/initializers/email_interceptor.rb"
template "config/initializers/email_prefixer.rb.tt"
copy_file "config/initializers/generators.rb"
template "config/initializers/marginalia.rb.tt"
copy_file "config/initializers/rack_deflater.rb"
copy_file "config/initializers/rack_timeout.rb"
copy_file "config/initializers/rollbar.rb"
copy_file "config/initializers/rotate_log.rb"
copy_file "config/initializers/rpm_instrumentations.rb"
copy_file "config/initializers/ruby_gntp.rb"
copy_file "config/initializers/secure_headers.rb"
copy_file "config/initializers/setup_email.rb"
copy_file "config/initializers/simple_form.rb"
copy_file "config/initializers/simple_form_bootstrap.rb"
copy_file "config/initializers/tagged_logging.rb"
copy_file "config/initializers/time_formats.rb"
copy_file "config/initializers/twilio_setup.rb"
copy_file "config/initializers/version.rb"

inject_into_file "config/initializers/assets.rb", after: /\z/ do
<<-CODE

Rails.application.config.assets.precompile += %w(
  application_desktop.css
  application_phone.css
  application_desktop.js
  application_phone.js
)

CODE
end

gsub_file "config/initializers/filter_parameter_logging.rb", /\[:password\]/ do
  "%w(password secret session cookie csrf)"
end

apply "config/environments/development.rb"
apply "config/environments/production.rb"
apply "config/environments/test.rb"
template "config/environments/staging.rb.tt"
