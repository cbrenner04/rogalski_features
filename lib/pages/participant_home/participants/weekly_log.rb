module ParticipantHome
  module Participants
    # page object for weekly exercise logs
    class WeeklyLog
      include Capybara::DSL

      def open
        click_on 'Complete Exercise Log'
      end

      def start
        find('button', text: 'Go To Exercise Log').click
      end

      def has_to_do_list_items?
        has_css?('.exercise-log-checkbox',
                 text: "Participant's #1 Assignment (',')") &&
          has_css?('.exercise-log-checkbox', text:
                   "Participant's #2 Assignment (',')")
      end

      def complete
        selections = ["Participant's #1 Assignment (',')",
                      "Participant's #2 Assignment (',')", 'Other']
        selections.each { |selection| check selection }
        find('#other-text').set('Some crazy weird task')

        selections.each do |selection|
          within '#details' do
            find('.exercise-name', text: "#{selection} (#{last_week})")
            within('.exercise-block', text: selection) do
              days.each do |day|
                execute_script('window.scrollBy(0, -500)')
                select_duration(selections.index(selection), day)
              end
            end
          end
        end

        choose ['yes', 'no'].sample
        fill_in 'exercise_log[comments]', with: 'Additional Comments'
        click_on 'Submit Exercise Log'
      end

      private

      def last_week
        now = Date.today
        sunday = now - now.wday
        monday = sunday - 6
        @last_week ||= "#{monday.strftime('%b. %-d, %Y')} - " \
                       "#{sunday.strftime('%b. %-d, %Y')}"
      end

      def select_duration(num, day)
        response = [0, '1-30', '30_'].sample
        find("label[for = 'exercise_log_exercise_log_details_attributes_" \
             "#{num}_#{day}_duration_#{response}']").click
      end

      def days
        @days ||= ['monday', 'tuesday', 'wednesday', 'thursday', 'friday',
                   'saturday', 'sunday'].sample(3)
      end
    end
  end
end
