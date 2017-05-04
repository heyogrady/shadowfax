prepend_to_file "app/assets/stylesheets/application.scss" do
  <<-SCSS.strip_heredoc
    @import "semantic-ui";

  SCSS
end

append_to_file "app/assets/stylesheets/application.scss" do
  <<-SCSS.strip_heredoc
    @import "semantic-ui/foot-locker";

  SCSS
end
