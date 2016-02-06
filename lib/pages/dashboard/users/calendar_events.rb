class Dashboard
  class Users
    # page object for user calendar events
    class CalendarEvents
      include Capybara::DSL

      def open
        find('.nav-list').find('a', text: 'Calendar events').click
      end

      def has_event?(event)
        [event[:participant], event[:title]].each do |i|
          has_css?('tr', text: i)
        end
        find('tr', text: event[:participant])
          .has_css?('.start_field', text: event[:start_date].strftime('%d %b'))
        find('tr', text: event[:participant])
          .has_css?('.start_field', text: event[:start_time].strftime('%H:M'))
        find('tr', text: event[:participant])
          .has_css?('.end_field', text: event[:end_date].strftime('%d %b'))
        find('tr', text: event[:participant])
          .has_css?('.end_field', text: event[:end_time].strftime('%H:%M'))
      end
    end
  end
end
