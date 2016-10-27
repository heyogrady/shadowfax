insert_into_file "config/application.rb", :before => /^  end/ do
  <<-'RUBY'

    # Bootscale needs this to prevent stale cache
    initializer :regenerate_require_cache, :before => :load_environment_config do
      Bootscale.regenerate
    end

    # Ensure non-standard paths are eager-loaded in production
    # (these paths are also autoloaded in development mode)
    # config.eager_load_paths += %W(#{config.root}/lib)
  RUBY
end

application 'config.action_mailer.preview_path = "#{Rails.root}/lib/mailer_previews"'
application do
<<-EOS
config.to_prepare do
      Devise::Mailer.layout "mailer"
    end
EOS
end
application 'config.time_zone = "Eastern Time (US & Canada)"'
application do
<<-EOS
# Custom directories with classes and modules that are autoloadable.
    config.autoload_paths += [
      "\#{config.root}/app/carriers",
      "\#{config.root}/app/facades",
      "\#{config.root}/app/services",
    ]
EOS
end
application 'config.assets.paths << Rails.root.join("app", "assets", "fonts")'
