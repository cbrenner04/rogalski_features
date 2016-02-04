# filename: ./spec/spec_helper.rb

require 'rspec'
require 'selenium-webdriver'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'

# RSpec configuration options
RSpec.configure do |config|
  config.full_backtrace = false
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.profile_examples = 10
end

# Capybara configuration options
Capybara.configure do |config|
  config.default_max_wait_time = 5
  config.register_driver :selenium do |app|
    Selenium::WebDriver::Firefox::Binary.path = ENV['Firefox_Path']
    Capybara::Selenium::Driver.new(app, browser: :firefox)
  end
  config.default_driver = :selenium
  config.page.driver.browser.manage.window.resize_to(1280, 743)
  config.save_and_open_page_path = 'spec/screenshots/'
end

# Capybara-screenshot configuration options
Capybara::Screenshot.register_filename_prefix_formatter(:rspec) do |example|
  example.description.tr(' ', '_').gsub(/^.*\/sp \//, ')')
end
Capybara::Screenshot.prune_strategy = :keep_last_run
