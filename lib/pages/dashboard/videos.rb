class Dashboard
  # page object for videos page
  class Videos
    include Capybara::DSL

    def initialize(video)
      @video_url = video[:video_url]
      @title = video[:title]
      @description = video[:description]
      @resource = video[:resource]
    end

    def open
      find('.nav-list').find('a', text: 'Videos').click
    end

    def assign
      find('legend', text: 'Assign videos').click
      click_on 'Add a new Video'
      sleep(1)
      within('.modal') do
        fill_in 'video[url]', with: @video_url
        fill_in 'video[title]', with: @title
        fill_in 'video[description]', with: @description
        fill_in 'video[resource]', with: @resource
        click_on 'Save'
      end
      sleep(1)
      click_on 'Save'
    end

    def present?
      [@video_url, @title].each { |i| has_css?('tr', text: i) }
    end
  end
end
