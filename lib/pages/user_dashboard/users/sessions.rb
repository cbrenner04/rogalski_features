# frozen_string_literal: true
module UserDashboard
  module Users
    # page object for editing user information
    class Sessions
      include RSpec::Matchers
      include Capybara::DSL

      def initialize(session)
        @participant = session[:participant]
        @title = session[:title]
        @start_time = session[:start_time]
        @end_time = session[:end_time]
        @instructions = session[:instructions]
      end

      def schedule
        find('legend', text: 'Schedule session').click
        sleep(0.25)
        click_on 'Add a new Calendar event'
        sleep(0.25)
        within('.modal') do
          fill_in 'calendar_event[title]', with: @title
          find('#calendar_event_start').click
          find('#calendar_event_start').set('')
          find('#calendar_event_start')
            .set(@start_time.strftime('%B %d, %Y %H:%M'))
          find('#calendar_event_end').click
          find('#calendar_event_end').set('')
          find('#calendar_event_end').set(@end_time.strftime('%B %d, %Y %H:%M'))
          within_frame(find('.wysihtml5-sandbox')) do
            find('body').set(@instructions)
          end
          sleep(0.25)
          find('.modal-header-title').click
          click_on 'Save'
        end
        sleep(0.5)
        click_on 'Save'
      end

      def open_calendar_events
        find('.sidebar-nav').find('a', text: 'Calendar events').click
      end

      def present?
        [@participant, @title].all? { |i| has_css?('tr', text: i) } &&
          pt_row
            .has_css?('.start_field', text: @start_time.strftime('%d %b')) &&
          has_correct_time?(@start_time, '.start_field') &&
          pt_row.has_css?('.end_field', text: @end_time.strftime('%d %b')) &&
          has_correct_time?(@end_time, '.end_field')
      end

      private

      def pt_row
        find('tr', text: @participant)
      end

      def has_correct_time?(time, field)
        exp_hour = time.strftime('%H')
        act_hour = pt_row.find(field).text[7..11].gsub(/:\w+/, '')
        sub_hour = act_hour.to_i - exp_hour.to_i

        exp_min = time.strftime('%M')
        act_min = pt_row.find(field).text[7..11].gsub(/\w+:/, '')
        sub_min = act_min.to_i - exp_min.to_i

        if sub_hour.between?(0, 1) && sub_min.between?(0, 1)
          pt_row
            .has_css?(field,
                      text: "#{act_hour.delete(' ')}:#{act_min.delete(' ')}")
        else
          expect(sub_hour).to be < 2,
                              'Expected and actual time are not within 1 hour'
          expect(sub_min).to be < 2,
                             'Expected and actual time are not within 2 minute'
        end
      end
    end
  end
end
