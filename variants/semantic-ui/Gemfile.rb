insert_into_file "Gemfile", :after => /gem "secure_headers".*\n/ do
  <<-GEMS.strip_heredoc
    gem "semantic-ui-sass", git: "https://github.com/heyogrady/semantic-ui-sass" # Semantic UI framework
  GEMS
end
