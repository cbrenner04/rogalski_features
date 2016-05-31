module ParticipantHome
  module Participants
    # page object for participant videos
    class Videos
      include Capybara::DSL

      def initialize(video)
        @title = video[:title]
        @description = video[:description]
      end

      def open
        click_on 'Watch'
      end

      def present?
        has_css?('h2', text: @title) &&
          has_css?('span', text: @description)
      end
    end
  end
end
