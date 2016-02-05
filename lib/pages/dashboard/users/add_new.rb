# Page object
class Dashboard
  # for Users
  class Users
    # Add New page
    class AddNew
      include Capybara::DSL

      def open
        click_on 'Add new'
      end

      def open_personal_information
        find('legend', text: 'Personal information').click
      end

      def fill_in_pers_info(user)
        user.default = ''
        fill_in 'user[email]', with: user[:email]
        fill_in 'user[display_name]', with: user[:display_name]
        fill_in 'user[password]', with: user[:password]
        fill_in 'user[password_confirmation]', with: user[:password]
        fill_in 'user[study_identity]', with: user[:study_id]
        click_on 'Add a new Contact'
        fill_in 'user[contact_attributes][email]', with: user[:email]
        fill_in 'user[contact_attributes][phone]', with: user[:phone]
        find('.hasDatepicker').set(user[:start_date])
      end

      def make_admin
        find('legend', text: 'Make admin').click
        sleep(1)
        check 'Is admin'
        sleep(1)
      end

      def create_admin(user)
        open_personal_information
        fill_in_pers_info(user)
        make_admin
        click_on 'Save'
      end

      def create_participant(user)
        open_personal_information
        fill_in_pers_info(user)
        click_on 'Save'
      end
    end
  end
end
