module UserDashboard
  module Users
    # page object for user assignments page
    class Assignments
      include Capybara::DSL

      def initialize(assignment)
        @title = assignment[:title]
        @user = assignment[:user]
        @instructions = assignment[:instructions]
      end

      def open
        find('.sidebar-nav').find('a', text: 'Assignments').click
      end

      def open_assignments_tab
        find('legend', text: 'Assignments').click
        sleep(1)
      end

      def create_assignment
        click_on 'Add a new Assignment'
        first('input').set(@title)
        execute_script('window.scrollBy(0,250)')
        first('.dropdown-toggle').click
        find('a', text: @user).click
        within_frame(find('.wysihtml5-sandbox')) do
          find('body').set(@instructions)
        end
      end

      def save
        click_on 'Save'
      end

      def present?
        pt_row = find('tr', text: @user)
        [@participant, @title].all? { |text| has_css?('tr', text: text) } &&
          pt_row.has_css?('.label-success') &&
          pt_row.has_css?('td', text: 'new') &&
          pt_row.has_css?('.completed_field', text: '‒')
      end
    end
  end
end
