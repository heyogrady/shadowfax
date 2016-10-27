prepend_to_file "app/assets/stylesheets/application.scss" do
  <<-SCSS.strip_heredoc
    @import "bootstrap-sprockets";
    @import "bootstrap/custom";

  SCSS
end

append_to_file "app/assets/stylesheets/application.scss" do
  <<-SCSS.strip_heredoc
    @import "bootstrap/devise_forms";

  SCSS
end
