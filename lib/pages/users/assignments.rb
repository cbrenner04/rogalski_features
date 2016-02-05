# page object
class Users
  # for assignments page
  class Assignments
    include Capybara::DSL

    def open
      find('.nav-list').find('a', text: 'Assignments').click
    end

    def has_assignment?(hash)
      [hash[:participant], hash[:title]].each { |i| has_css?('tr', text: i) }
      find('tr', text: hash[:participant]).has_css?('.badge-success')
      find('tr', text: hash[:participant]).has_css?('td', text: 'new')
      find('tr', text: hash[:participant])
        .has_css?('.completed_field', text: '-')
    end
  end
end
