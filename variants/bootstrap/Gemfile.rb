insert_into_file "Gemfile", :after => /gem "bootscale".*\n/ do
  <<-GEMS.strip_heredoc
    gem "bootstrap-sass", "~> 3.3" # Bootstrap framework
  GEMS
end

insert_into_file "Gemfile", :after => /gem "fog-aws".*\n/ do
  <<-GEMS.strip_heredoc
    gem "font-awesome-sass", "~> 4.3.0" # To use Font Awesome
  GEMS
end
