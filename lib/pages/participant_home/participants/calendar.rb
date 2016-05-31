module ParticipantHome
  module Participants
    # page object for the calendar page
    class Calendar
      include Capybara::DSL

      def open
        click_on 'Calendar'
      end

      def has_event?
        has_css?('.fc-event', text: 'Today\'s event')
      end

      def switch_to_week
        find('.fc-agendaWeek-button').click
      end

      def has_week?
        format = span_two_months ? '%b %-d, %Y' : '%-d, %Y'
        has_css?('h2', text: "#{@sunday.strftime('%b %-d')} — " \
                             "#{@saturday.strftime(format)}")
      end

      def switch_to_day
        find('.fc-agendaDay-button').click
      end

      def has_day?
        has_css?('h2', text: Date.today.strftime('%b %-d, %Y')) &&
          has_css?('.fc-day-header', text: Date.today.strftime('%A'))
      end

      def switch_to_month
        find('.fc-month-button').click
      end

      def has_month?
        has_css?('h2', text: Date.today.strftime('%B %Y'))
      end

      def open_event_detail
        find('.fc-event', text: 'Today\'s event').click
      end

      def has_event_detail?
        has_css?('.simplemodal-container',
                 text: 'Today\'s event Best event ever')
      end

      def close_event_detail
        find('.modalCloseImg').click
      end

      def increment_calendar
        execute_script('window.scrollBy(0, -500)')
        find('.fc-next-button').click
      end

      def decrement_calendar
        execute_script('window.scrollBy(0, -500)')
        find('.fc-prev-button').click
      end

      def return_to_today
        find('.fc-button', text: 'today').click
      end

      def has_next_month?
        next_month = Date.today >> 1
        has_css?('h2', text: next_month.strftime('%B %Y'))
      end

      def has_previous_month?
        prev_month = Date.today << 1
        has_css?('h2', text: prev_month.strftime('%B %Y'))
      end

      def has_next_week?
        now = Date.today
        sunday = now - now.wday
        next_week = sunday + 7
        has_css?('h2', text: next_week.strftime('%b %-d'))
      end

      def has_previous_week?
        now = Date.today
        sunday = now - now.wday
        prev_week = sunday - 7
        has_css?('h2', text: prev_week.strftime('%b %-d'))
      end

      def has_next_day?
        next_day = Date.today + 1
        has_css?('h2', text: next_day.strftime('%B %-d, %Y')) &&
          has_css?('.fc-day-header', text: next_day.strftime('%A'))
      end

      def has_previous_day?
        prev_day = Date.today - 1
        has_css?('h2', text: prev_day.strftime('%B %-d, %Y')) &&
          has_css?('.fc-day-header', text: prev_day.strftime('%A'))
      end

      private

      def span_two_months
        return true if month_dif > 0
      end

      def month_dif
        now = Date.today
        @sunday = now - now.wday
        @saturday = @sunday + 6
        @saturday.mon - @sunday.mon
      end
    end
  end
end
