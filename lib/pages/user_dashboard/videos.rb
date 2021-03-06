# frozen_string_literal: true
module UserDashboard
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
      find('.sidebar-nav').find('a', text: 'Videos').click
    end

    def assign
      find('legend', text: 'Assign videos').click
      click_on 'Add a new Video'
      sleep(0.25)
      within('.modal') do
        fill_in 'video[url]', with: @video_url
        fill_in 'video[title]', with: @title
        fill_in 'video[description]', with: @description
        fill_in 'video[resource]', with: @resource
        click_on 'Save'
      end
      sleep(0.5)
      click_on 'Save'
    end

    def present?
      [@video_url, @title].all? { |i| has_css?('tr', text: i) }
    end

    def open_views
      find('.sidebar-nav').find('a', text: 'Video views').click
    end

    def has_view_data?
      has_text?('1 video view') &&
        has_css?('tr',
                 text: "#{@title} #{Time.now.strftime('%B %d, %Y %H:%M')}")
    end
  end
end
