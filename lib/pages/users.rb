# Page object for Users
class Users
  include Capybara::DSL

  def open
    find('.icon-user').click
  end

  def assert_on_page
    has_css?('h1', text: 'List of Users')
  end

  def has_user?(user)
    has_css?('tr', text: user)
  end

  def has_participant?(user, display_name, study_id)
    [user, display_name, study_id].each { |text| has_user?(text) }
  end
end
