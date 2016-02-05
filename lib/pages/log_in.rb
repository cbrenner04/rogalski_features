# page object for Log in page
class LogIn
  include Capybara::DSL

  def log_in_as(hash)
    visit ENV['Base_URL']
    fill_in 'user[email]', with: hash[:email]
    fill_in 'user[password]', with: hash[:password]
    click_on 'Sign In'
  end
end