# Page object for Users Add New page
class Users
  class AddNew
    include Capybara::DSL

    def open
      click_on 'Add new'
    end

    def open_personal_information
      find('legend', text: 'Personal information').click
    end

    def fill_in_pers_info(user, display, password, study_id, phone, start_date)
      fill_in 'user[email]', with: user
      fill_in 'user[display_name]', with: display
      fill_in 'user[password]', with: password
      fill_in 'user[password_confirmation]', with: password
      fill_in 'user[study_identity]', with: study_id
      click_on 'Add a new Contact'
      fill_in 'user[contact_attributes][email]', with: user
      fill_in 'user[contact_attributes][phone]', with: phone
      find('.hasDatepicker').set(start_date)
    end

    def make_admin
      find('legend', text: 'Make admin').click
      find('input[type = checkbox]').click
    end

    def create_admin(user, password)
      open_personal_information
      fill_in_pers_info(user, '', password, '', '', '')
      make_admin
      click_on 'Save'
    end

    def create_participant(user, display, password, study_id, phone, start_date)
      open_personal_information
      fill_in_pers_info(user, display, password, study_id, phone, start_date)
      click_on 'Save'
    end
  end
end
