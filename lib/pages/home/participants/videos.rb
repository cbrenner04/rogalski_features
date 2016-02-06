class Home
  class Participants
    # page object for participant videos
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
