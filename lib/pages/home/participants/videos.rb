# page object
class Home
  # for Participants
  class Participants
    # for videos
    class Videos
      include Capybara::DSL

      def open
        click_on 'Watch'
      end

      def has_video?(video)
        has_css?('h2', text: video[:title])
        has_css?('span', text: video[:description])
      end
    end
  end
end
