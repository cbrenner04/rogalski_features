class Dashboard
  class Users
    # page object for user assignments page
    class Assignments
      include Capybara::DSL

      def open
        find('.nav-list').find('a', text: 'Assignments').click
      end

      def has_assignment?(assignment)
        [assignment[:participant], assignment[:title]].each do |i|
          has_css?('tr', text: i)
        end
        find('tr', text: assignment[:participant]).has_css?('.badge-success')
        find('tr', text: assignment[:participant]).has_css?('td', text: 'new')
        find('tr', text: assignment[:participant])
          .has_css?('.completed_field', text: '-')
      end
    end
  end
end
