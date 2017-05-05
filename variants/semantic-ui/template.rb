source_paths.unshift(File.dirname(__FILE__))

apply "Gemfile.rb"

apply "app/assets/stylesheets/application.scss.rb"
copy_file "app/assets/stylesheets/semantic-ui/foot-locker.scss"

apply "app/assets/javascripts/application.js.rb"
copy_file "app/assets/javascripts/common/semantic-ui.js"

copy_file "app/inputs/sui_check_boxes_input.rb"
copy_file "app/inputs/sui_currency_input.rb"
copy_file "app/inputs/sui_multiselect_input.rb"
copy_file "app/inputs/sui_percentage_input.rb"
copy_file "app/inputs/sui_percentage_one_decimal_input.rb"
copy_file "app/inputs/sui_percentage_two_decimal_input.rb"
copy_file "app/inputs/sui_radio_buttons_input.rb"
copy_file "app/inputs/sui_select_input.rb"
copy_file "app/inputs/sui_slider_group_input.rb"

copy_file "app/views/layouts/application.html.erb", force: true
template "app/views/shared/_footer.html.erb.tt"
template "app/views/shared/_menu.html.erb.tt"
copy_file "app/views/shared/_page_header.erb"

copy_file "config/initializers/simple_form.rb", force: true
copy_file "config/initializers/simple_form_semantic_ui.rb"

copy_file "lib/templates/erb/controller/view.html.erb"
copy_file "lib/templates/erb/scaffold/_form.html.erb"
copy_file "lib/templates/erb/scaffold/edit.html.erb"
copy_file "lib/templates/erb/scaffold/index.html.erb"
copy_file "lib/templates/erb/scaffold/new.html.erb"
copy_file "lib/templates/erb/scaffold/show.html.erb"
