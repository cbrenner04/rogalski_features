# Page object for the Admin page
class Admin
  include Capybara::DSL

  def visible?
    find('h1', text: 'Site Administration')
  end
end
