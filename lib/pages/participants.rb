# page object for Participants
class Participants
  include Capybara::DSL

  def open_session
    find('#next-session').click
  end

  def has_session?(hash)
    within('.simplemodal-container') do
      has_css?('h1', text: hash[:title])
      has_css?('h3', text: hash[:instructions])
    end
  end
end
