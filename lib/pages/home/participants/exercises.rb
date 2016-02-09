class Home
  class Participants
    # page object for Exercises
    class Exercises
      include Capybara::DSL

      def initialize(exercise)
        @status = exercise[:status]
        @title = exercise[:title]
        @instructions = exercise[:instructions]
        @hint_1 = exercise[:hint_1]
        @hint_2 = exercise[:hint_2]
        @hint_3 = exercise[:hint_3]
      end

      def present?
        find('#to-do-list').has_css?(".#{@status}", text: @title)
      end

      def select_exercise
        find('#to-do-list')
          .find(".#{@status}", text: @title)
          .find('.fa-plus-circle').click
        sleep(1)
      end

      def has_instructions?
        within('.col.half.last') do
          has_css?('.heading', text: @title)
          has_css?('.wrapper', text: @instructions)
        end
      end

      def start
        first('button', text: 'Go To Exercise').click
        click_on 'Start'
      end

      def audio_exercise?
        has_css?('button', text: 'Press to record Description')
      end

      def has_correct_hints?
        [@hint_1, @hint_2, @hint_3].each do |i|
          click_on 'Hint'
          has_no_css?('.hidden', text: i)
          has_css?('.hint', text: i)
        end
      end

      def start_audio_record
        click_on 'Press to record Description'
      end

      def stop_audio_record
        click_on 'Press when your description is complete.'
      end

      def finish
        click_on 'Finish'
      end
    end
  end
end
