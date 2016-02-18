class Home
  class Participants
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
        find('.fc-button', text: 'week').click
      end

      def has_week?
        if span_two_months
          has_css?('h2', text: "#{@sunday.strftime('%b %-d')} — " \
                               "#{@saturday.strftime('%b %-d %Y')}")
        else
          has_css?('h2', text: "#{@sunday.strftime('%b %-d')} — " \
                               "#{@saturday.strftime('%-d %Y')}")
        end
      end

      def switch_to_day
        all('.fc-button', text: 'day')[0].click
      end

      def has_day?
        has_css?('h2', text: Date.today.strftime('%A, %b %-d, %Y'))
      end

      def switch_to_month
        find('.fc-button', text: 'month').click
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
        all('.fc-text-arrow')[1].click
      end

      def decrement_calendar
        execute_script('window.scrollBy(0, -500)')
        all('.fc-text-arrow')[0].click
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
        has_css?('h2', text: next_day.strftime('%A, %b %-d, %Y'))
      end

      def has_previous_day?
        prev_day = Date.today - 1
        has_css?('h2', text: prev_day.strftime('%A, %b %-d, %Y'))
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
