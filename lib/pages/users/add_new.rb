# Page object
class Users
  # for Users Add New page
  class AddNew
    include Capybara::DSL

    def open
      click_on 'Add new'
    end

    def open_personal_information
      find('legend', text: 'Personal information').click
    end

    def fill_in_pers_info(hash)
      hash.default = ''
      fill_in 'user[email]', with: hash[:email]
      fill_in 'user[display_name]', with: hash[:display_name]
      fill_in 'user[password]', with: hash[:password]
      fill_in 'user[password_confirmation]', with: hash[:password]
      fill_in 'user[study_identity]', with: hash[:study_id]
      click_on 'Add a new Contact'
      fill_in 'user[contact_attributes][email]', with: hash[:email]
      fill_in 'user[contact_attributes][phone]', with: hash[:phone]
      find('.hasDatepicker').set(hash[:start_date])
    end

    def make_admin
      find('legend', text: 'Make admin').click
      sleep(1)
      check 'Is admin'
      sleep(1)
    end

    def create_admin(hash)
      open_personal_information
      fill_in_pers_info(hash)
      make_admin
      click_on 'Save'
    end

    def create_participant(hash)
      open_personal_information
      fill_in_pers_info(hash)
      click_on 'Save'
    end
  end
end
