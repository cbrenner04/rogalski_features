# page object
class Users
  # for videos page
  class Videos
    include Capybara::DSL

    def open
      find('.nav-list').find('a', text: 'Videos').click
    end

    def has_video?(hash)
      [hash[:video_url], hash[:title]].each { |i| has_css?('tr', text: i) }
    end
  end
end
