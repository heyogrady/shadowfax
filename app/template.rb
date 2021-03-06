empty_directory_with_keep_file "app/facades"
empty_directory_with_keep_file "app/workers"

copy_file "app/assets/stylesheets/common/active_admin.scss"
copy_file "app/assets/stylesheets/common/alerts.scss"
copy_file "app/assets/stylesheets/common/base.scss"
copy_file "app/assets/stylesheets/active_admin.scss"
copy_file "app/assets/stylesheets/application.scss"

remove_file "app/assets/stylesheets/application.css"

copy_file "app/assets/javascripts/common/active_admin.js"
copy_file "app/assets/javascripts/active_admin.js.coffee"
copy_file "app/assets/javascripts/application.js", force: true

copy_file "app/admin/dashboard.rb"
copy_file "app/admin/user.rb"

copy_file "app/carriers/layout_carrier.rb"

copy_file "app/controllers/api/v1/base_controller.rb"
copy_file "app/controllers/api/v1/sessions_controller.rb"
copy_file "app/controllers/api/v1/users_controller.rb"
copy_file "app/controllers/superadmin/base_controller.rb"
copy_file "app/controllers/superadmin/users_controller.rb"
copy_file "app/controllers/application_controller.rb", force: true
copy_file "app/controllers/contacts_controller.rb"
copy_file "app/controllers/home_controller.rb"
copy_file "app/controllers/pages_controller.rb"
copy_file "app/controllers/registrations_controller.rb"
copy_file "app/controllers/sessions_controller.rb"

copy_file "app/helpers/application_helper.rb", force: true
copy_file "app/helpers/layout_helper.rb"
copy_file "app/helpers/javascript_helper.rb"
copy_file "app/helpers/retina_image_helper.rb"

copy_file "app/javascript/packs/app.vue"
copy_file "app/javascript/packs/application.js"
copy_file "app/javascript/packs/hello_vue.js"

copy_file "app/mailers/base_mailer.rb"
copy_file "app/mailers/mailer.rb"

copy_file "app/models/application_record.rb"
copy_file "app/models/contact.rb"
copy_file "app/models/user.rb"

copy_file "app/services/addition_service.rb"

copy_file "app/uploaders/profile_image_uploader.rb"

copy_file "app/views/home/index.html.haml"
copy_file "app/views/layouts/application.html.erb", force: true
template "app/views/layouts/base.html.erb.tt", "app/views/layouts/base.html.erb"
copy_file "app/views/layouts/mailer.haml"
copy_file "app/views/layouts/superadmin.html.haml"
copy_file "app/views/mailer/contact_us_notification.html.haml"
copy_file "app/views/pages/about.html.haml"
copy_file "app/views/pages/contact_us.html.haml"
copy_file "app/views/pages/index.html.haml"
copy_file "app/views/shared/_bootstrap_flash.html.haml"
copy_file "app/views/shared/_modal.html.haml"
copy_file "app/views/shared/_nav.html.haml"
copy_file "app/views/shared/_superadmin_nav.html.haml"
copy_file "app/views/shared/_user_is_signed_in.html.haml"
copy_file "app/views/shared/_user_right_nav.html.haml"
copy_file "app/views/superadmin/users/_edit_modal.html.haml"
copy_file "app/views/superadmin/users/index.html.haml"
copy_file "app/views/users/confirmations/new.html.haml"
copy_file "app/views/users/mailer/confirmation_instructions.html.haml"
copy_file "app/views/users/mailer/reset_password_instructions.html.haml"
copy_file "app/views/users/mailer/unlock_instructions.html.haml"
copy_file "app/views/users/passwords/edit.html.haml"
copy_file "app/views/users/passwords/new.html.haml"
copy_file "app/views/users/registrations/edit.html.haml"
copy_file "app/views/users/registrations/edit_password.html.haml"
copy_file "app/views/users/registrations/new.html.haml"
copy_file "app/views/users/sessions/new.html.haml"
copy_file "app/views/users/shared/_links.haml"
copy_file "app/views/users/unlocks/new.html.haml"
