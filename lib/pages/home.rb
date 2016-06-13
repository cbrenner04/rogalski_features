# frozen_string_literal: true
# Page object for the home Page
class Home
  include Capybara::DSL

  def visible?
    has_css?('h4', text: 'Welcome to Communication Bridge')
  end
end
