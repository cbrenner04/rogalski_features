module ParticipantHome
  module Participants
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
        @word = exercise[:word]
        @spelling = exercise[:spelling]
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
          has_css?('.heading', text: @title) &&
            has_css?('.wrapper', text: @instructions)
        end
      end

      def start
        first('button', text: 'Go To Exercise').click
        click_on 'Start'
      end

      def audio_exercise?
        has_css?('button', text: 'Hint')
      end

      def multi_exercise?
        has_css?('h1', text: @word) && has_css?('h2', text: @spelling)
      end

      def picture_exercise?
        has_css?('input[placeholder = "Enter the name here"]')
      end

      def has_correct_audio_hints?
        [@hint_1, @hint_2, @hint_3].all? do |i|
          click_on 'Hint'
          has_no_css?('.hidden', text: i) && has_css?('.hint', text: i)
        end
      end

      def has_correct_picture_hints?
        [@hint_1, @hint_2, @hint_3].all? do |i|
          click_on 'Get a hint'
          has_no_css?('.hidden', text: i) && has_css?('.hint', text: i)
        end
      end

      def start_audio_record
        if has_css?('button', text: 'Description')
          click_on 'Press to record Description'
        else
          click_on 'Press to record Word'
        end
      end

      def stop_audio_record
        click_on 'Press when your description is complete.'
      end

      def answer
        find('input[placeholder = "Enter the name here"]').set('Example Answer')
        click_on 'Answer'
      end

      def finish
        click_on 'Finish'
      end
    end
  end
end
