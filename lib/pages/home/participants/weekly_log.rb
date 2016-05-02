class Home
  class Participants
    # page object for weekly exercise logs
    class WeeklyLog
      include Capybara::DSL

      def open
        click_on 'Complete Exercise Log'
      end

      def start
        find('button', text: 'Go To Exercise Log').click
      end

      def complete
        selections = ['New Assignment', 'Other']
        selections.each { |s| check s }
        find('#other-text').set('Some crazy weird task')

        selections.each do |s|
          within '#details' do
            find('.exercise-name', text: "#{s} (#{last_week})")
            within('.exercise-block', text: s) do
              day.each do |d|
                execute_script('window.scrollBy(0, -500)')
                select_duration(selections.index(s), d)
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

      def day
        @day ||= ['monday', 'tuesday', 'wednesday', 'thursday', 'friday',
                  'saturday', 'sunday'].sample(3)
      end
    end
  end
end
