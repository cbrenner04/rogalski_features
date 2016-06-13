# frozen_string_literal: true
module UserDashboard
  # page object for Users
  class User
    include Capybara::DSL

    def initialize(user)
      user.default = ''
      @email = user[:email]
      @display_name = user[:display_name]
      @password = user[:password]
      @study_id = user[:study_id]
      @phone = user[:phone]
      @start_date = user[:start_date]
      @assignment = user[:assignment]
      @session = user[:session]
      @video = user[:video]
    end

    def sign_in
      visit ENV['Base_URL']
      fill_in 'user[email]', with: @email
      fill_in 'user[password]', with: @password
      click_on 'Sign In'
    end

    def log_out
      click_on 'Log out'
    end

    def visit_participants
      click_on 'Home'
    end

    def visit_admin
      click_on 'Admin'
    end

    def open_users
      find('.icon-user').click
    end

    def open_add_new_tab
      click_on 'Add new'
    end

    def open_personal_information
      find('legend', text: 'Personal information').click
    end

    def assert_on_page
      find('h1', text: 'List of Users')
    end

    def present?
      [@email, @display_name, @study_id].all? do |text|
        has_css?('tr', text: text)
      end
    end

    def fill_in_pers_info
      fill_in 'user[email]', with: @email
      fill_in 'user[display_name]', with: @display_name
      fill_in 'user[password]', with: @password
      fill_in 'user[password_confirmation]', with: @password
      fill_in 'user[study_identity]', with: @study_id
      click_on 'Add a new Contact'
      fill_in 'user[contact_attributes][email]', with: @email
      fill_in 'user[contact_attributes][phone]', with: @phone
      fill_in 'user[start_date]', with: @start_date
    end

    def make_admin
      find('legend', text: 'Make admin').click
      sleep(0.5)
      check 'Is admin'
      sleep(0.5)
    end

    def create_admin
      open_personal_information
      fill_in_pers_info
      make_admin
      click_on 'Save'
    end

    def create_participant
      open_personal_information
      fill_in_pers_info
      click_on 'Save'
    end

    def open_edit_page_for(user)
      find('tr', text: user).find('.icon-pencil').click
    end

    def open_info_page_for(user)
      find('tr', text: user).find('.icon-info-sign').click
    end

    def has_assignment?
      has_css?('.well', text: @assignment)
    end

    def has_session?
      has_css?('.well', text: @session)
    end

    def has_video?
      has_css?('.well', text: @video)
    end

    def open_responses
      find('.sidebar-nav').find('a', text: 'Responses').click
    end
  end
end
