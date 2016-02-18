class Home
  class Participants
    # page object for Contact/Help page
    class ContactHelp
      include Capybara::DSL

      def open
        click_on 'Contact/Help'
      end

      def visible?
        contact_text = ['Contact The Study',
                        'communicationbridge@northwestern.edu',
                        '(312) 503-4238', 'Watch Introduction']
        contact_text.each { |c| has_text? c }
      end

      def play_video
        find('iframe[src = "//player.vimeo.com/video/87519790"]').click
        sleep(2)
      end
    end
  end
end
