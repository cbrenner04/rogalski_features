class Home
  class Participants
    # page object for Exercise log
    class ExerciseLog
      include Capybara::DSL

      def complete
        resp = ['0 to 30 minutes', '30 minutes to one hour',
                'More than one hour'].sample
        find("input[value = '#{resp}']").click
        random = rand(2)
        if random == 1
          find('input[value = "1"]').click
        end
        fill_in 'compliance_form[day_practiced]', with: Date.today
        fill_in 'compliance_form[comment]', with: "I wrote this #{Date.today}"
        click_on 'Submit Exercise Log' # this doesn't seem to be registering
        # also tried find('input[value = "submit"]').click
        # in both ways it thinks it has clicked the button but nothing happens
      end

      def submitted?
        has_css?('.simplemodal-container', text: 'Exercise Log Submitted')
      end

      def close_modal
        find('.simplemodal-close').click
      end
    end
  end
end
