class Dashboard
  # page object for videos page
  class Videos
    include Capybara::DSL

    def open
      find('.nav-list').find('a', text: 'Videos').click
    end

    def has_video?(video)
      [video[:video_url], video[:title]].each { |i| has_css?('tr', text: i) }
    end
  end
end
