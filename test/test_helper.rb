ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
require 'rails-controller-testing'
Rails::Controller::Testing.install

Minitest::Reporters.use!

class ActiveSupport::TestCase
#   include Mongoid::FixtureSet::TestHelper
#   self.fixture_path = "#{Rails.root}/test/fixtures"
end
