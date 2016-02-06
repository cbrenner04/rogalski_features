class Home
  class Participants
    # page object for Exercises
    class Exercises
      include Capybara::DSL

      def select_exercise(exercise)
        find('#to-do-list')
          .find('.not-complete', text: exercise[:title])
          .find('.fa-plus-circle').click
      end

      def has_exercise_instructions?(exercise)
        within('.col.half.last') do
          has_css?('.heading', text: exercise[:title])
          has_css?('.wrapper', text: exercise[:instructions])
        end
      end

      def start_exercise
        first('button', text: 'Go To Exercise').click
        click_on 'Start'
      end

      def audio_exercise?
        has_css?('button', text: 'Press to record Description')
      end

      def has_correct_hints?(exercise)
        [exercise[:hint_1], exercise[:hint_2], exercise[:hint_3]].each do |i|
          click_on 'Hint'
          has_no_css?('.hidden', text: i)
          has_css?('.hint', text: i)
        end
      end
    end
  end
end
