if ENV["CODECLIMATE_REPO_TOKEN"]
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

require "simplecov"

if ENV["CIRCLE_ARTIFACTS"]
  dir = File.join("..", "..", "..", "..", ENV["CIRCLE_ARTIFACTS"], "coverage")
  SimpleCov.coverage_dir(dir)
end

SimpleCov.start do
  add_filter "/test/"
  add_filter "/config/"

  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Services", "app/services"
  add_group "Helpers", "app/helpers"
  add_group "Mailers", "app/mailers"
  add_group "Workers", "app/workers"
  add_group "Jobs", "app/jobs"
  add_group "Carriers", "app/carriers"
  add_group "Uploaders", "app/uploaders"
  add_group "Facades", "app/facades"
end

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../../config/environment", __FILE__)
require "rails/test_help"

class ActiveSupport::TestCase

  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alpha order.
  fixtures :all

  include FactoryGirl::Syntax::Methods

end
