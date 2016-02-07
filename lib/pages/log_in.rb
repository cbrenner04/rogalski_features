# page object for Log in page
class LogIn
  include Capybara::DSL

  def initialize(user)
    @email = user[:email]
    @password = user[:password]
  end

  def sign_in
    visit ENV['Base_URL']
    fill_in 'user[email]', with: @email
    fill_in 'user[password]', with: @password
    click_on 'Sign In'
  end
end
