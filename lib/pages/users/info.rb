# page object for user info page
class Users
  class Info
    include Capybara::DSL

    def open_for(participant)
      find('tr', text: participant).find('.icon-info-sign').click
    end

    def has_assignment?(hash)
      find('.well', text: hash[:title])
    end

    def has_session?(hash)
      find('.well', text: hash[:title])
    end

    def has_video?(hash)
      find('.well', text: hash[:title])
    end
  end
end
