# page object
class Dashboard
  # for Users
  class Users
    # for calendar events
    class CalendarEvents
      include Capybara::DSL

      def open
        find('.nav-list').find('a', text: 'Calendar events').click
      end

      def has_event?(hash)
        [hash[:participant], hash[:title]].each { |i| has_css?('tr', text: i) }
        find('tr', text: hash[:participant])
          .has_css?('.start_field', text: hash[:start_date].strftime('%d %b'))
        find('tr', text: hash[:participant])
          .has_css?('.start_field', text: hash[:start_time].strftime('%H:M'))
        find('tr', text: hash[:participant])
          .has_css?('.end_field', text: hash[:end_date].strftime('%d %b'))
        find('tr', text: hash[:participant])
          .has_css?('.end_field', text: hash[:end_time].strftime('%H:%M'))
      end
    end
  end
end
