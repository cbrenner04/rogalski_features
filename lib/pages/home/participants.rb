class Home
  # page object for Participants
  class Participants
    include Capybara::DSL

    def initialize(participant)
      @email = participant[:email]
      @password = participant[:password]
    end

    def sign_in
      visit ENV['Base_URL']
      fill_in 'user[email]', with: @email
      fill_in 'user[password]', with: @password
      click_on 'Sign In'
    end

    def sign_out
      click_on 'SIGN OUT'
    end
  end
end
