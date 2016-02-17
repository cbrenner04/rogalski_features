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
        exercise = ['Script Training', 'Picture Cards', 
                    'Auditory Comprehension Strategies',
                    'Writing Strategies', 'Picture Aids', 'Other']
        selections = exercise.sample(3)
        selections.each { |s| check s }
        if selections.include? 'Other'
          find('#other-text').set('Some crazy weird task')
        end

        selections.each do |s|
          within '#details' do
            now = Date.today
            sunday = now - now.wday
            monday = sunday - 6
            last_week = "#{monday.strftime('%b. %-d, %Y')} - " \
                        "#{sunday.strftime('%b. %-d, %Y')}"
            find('.exercise-name', text: "#{s} (#{last_week})")
            element = s.downcase.gsub(' ', '-')
            within("##{element}", text: "#{s}") do
              num = exercise.index("#{s}")
              day = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday',
                     'saturday', 'sunday'].sample(3)
              day.each do |d|
                find("label[for = 'exercise_log_exercise_log_details_" \
                     "attributes_#{num}_is_duration_under_30_minutes_#{d}" \
                     "_false']").click
              end
            end
          end
        end

        choose ['yes', 'no'].sample
        fill_in 'exercise_log[comments]', with: 'Additional Comments'
        click_on 'Submit Exercise Log'
      end
    end
  end
end
