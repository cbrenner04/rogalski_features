# page object for Log in page
class LogIn
  include Capybara::DSL

  def log_in_as(user)
    visit ENV['Base_URL']
    fill_in 'user[email]', with: user[:email]
    fill_in 'user[password]', with: user[:password]
    click_on 'Sign In'
  end
end