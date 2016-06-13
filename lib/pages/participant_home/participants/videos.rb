# frozen_string_literal: true
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

      def play
        sleep(1)
        find('iframe[src = "//player.vimeo.com/video/164554825?' \
             'api=1&player_id=164554825"]').click
        sleep(2)
      end
    end
  end
end
