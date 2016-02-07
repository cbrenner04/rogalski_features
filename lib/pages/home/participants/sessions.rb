class Home
  class Participants
    # page object for Participants Sessions
    class Sessions
      include Capybara::DSL

      def initialize(participant)
        @title = participant[:title]
        @instructions = participant[:instructions]
      end

      def open
        find('#next-session').click
      end

      def present?
        within('.simplemodal-container') do
          has_css?('h1', text: @title)
          has_css?('h3', text: @instructions)
        end
      end
    end
  end
end
