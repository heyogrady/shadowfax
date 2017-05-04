source_paths.unshift(File.dirname(__FILE__))

apply "Gemfile.rb"

apply "app/assets/stylesheets/application.scss.rb"
copy_file "app/assets/stylesheets/bootstrap/custom.scss"
copy_file "app/assets/stylesheets/bootstrap/devise_forms.scss"

apply "app/assets/javascripts/application.js.rb"
copy_file "app/assets/javascripts/common/bootstrap.js"
copy_file "app/assets/javascripts/common/modal_behavior.js"

copy_file "app/helpers/navbar_helper.rb"
template "app/views/shared/_footer.html.erb.tt"
template "app/views/shared/_navbar.html.erb.tt"
copy_file "app/views/shared/_page_header.erb"

copy_file "config/initializers/simple_form_bootstrap.rb", force: true

copy_file "lib/templates/erb/controller/view.html.erb"
copy_file "lib/templates/erb/scaffold/_form.html.erb"
copy_file "lib/templates/erb/scaffold/edit.html.erb"
copy_file "lib/templates/erb/scaffold/index.html.erb"
copy_file "lib/templates/erb/scaffold/new.html.erb"
copy_file "lib/templates/erb/scaffold/show.html.erb"
copy_file "test/helpers/navbar_helper_test.rb"
