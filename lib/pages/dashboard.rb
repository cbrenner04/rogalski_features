# Page object for the Dashboard
class Dashboard
  include Capybara::DSL

  def visible?
    find('h1', text: 'Site Administration')
  end

  def visit_participants
    click_on 'Home'
  end

  def visit_admin
    click_on 'Admin'
  end

  def log_out
    click_on 'Log out'
  end
end
