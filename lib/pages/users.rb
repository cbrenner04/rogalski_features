# Page object for Users
class Users
  include Capybara::DSL

  def open
    find('.icon-user').click
  end

  def assert_on_page
    has_css?('h1', text: 'List of Users')
  end

  def has_user?(hash)
    hash.default = ''
    [hash[:email], hash[:display_name], hash[:study_id]].each do |text|
      has_css?('tr', text: text)
    end
  end
end
