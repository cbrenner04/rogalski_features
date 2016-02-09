# Page object for the Dashboard
class Dashboard
  include Capybara::DSL

  def visible?
    find('h1', text: 'Site Administration')
  end
end
