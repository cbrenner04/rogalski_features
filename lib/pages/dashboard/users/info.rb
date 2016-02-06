class Dashboard
  class Users
    # page object for user info page
    class Info
      include Capybara::DSL

      def open_for(participant)
        find('tr', text: participant).find('.icon-info-sign').click
      end

      def has_assignment?(assignment)
        find('.well', text: assignment[:title])
      end

      def has_session?(session)
        find('.well', text: session[:title])
      end

      def has_video?(video)
        find('.well', text: video[:title])
      end
    end
  end
end
