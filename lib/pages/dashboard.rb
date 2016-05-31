# Page object for the Dashboard
class Dashboard
  include Capybara::DSL

  def visible?
    has_css?('h1', text: 'Site Administration')
  end
end
