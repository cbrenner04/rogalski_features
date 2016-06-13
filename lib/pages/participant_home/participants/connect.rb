# frozen_string_literal: true
module ParticipantHome
  module Participants
    # page object for connect page
    class Connect
      include Capybara::DSL

      def open
        click_on 'Connect'
      end

      def has_details?
        has_text?('Today\'s event Best event ever Select this link to go to ' \
                  'your event: Go to this event The following is your passwo' \
                  'rd to access the meeting: go!') &&
          has_css?('a[href = "http://google.com"]')
      end
    end
  end
end
