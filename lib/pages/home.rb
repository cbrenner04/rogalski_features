# Page object for the home Page
class Home
  include Capybara::DSL

  def log_in_as(user, password)
    visit ENV['Base_URL']
    fill_in 'user[email]', with: user
    fill_in 'user[password]', with: password
    click_on 'Sign In'
  end
end
