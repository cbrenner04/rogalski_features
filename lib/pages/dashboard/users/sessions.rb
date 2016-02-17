class Dashboard
  class Users
    # page object for editing user information
    class Sessions
      include RSpec::Matchers
      include Capybara::DSL

      def initialize(session)
        @participant = session[:participant]
        @title = session[:title]
        @start_date = session[:start_date]
        @start_time = session[:start_time]
        @end_date = session[:end_date]
        @end_time = session[:end_time]
        @instructions = session[:instructions]
      end

      def schedule
        find('legend', text: 'Schedule session').click
        sleep(1)
        click_on 'Add a new Calendar event'
        sleep(1)
        within('.modal') do
          fill_in 'calendar_event[title]', with: @title
          date_pickers = all('.hasDatepicker')
          time_pickers = all('.hasTimepicker')
          date_pickers[0].set(@start_date)
          time_pickers[0].set(@start_time)
          date_pickers[1].set(@end_date)
          time_pickers[1].set(@end_time)
          within_frame(find('.wysihtml5-sandbox')) do
            find('body').set(@instructions)
          end
          find('.modal-header-title').click
          click_on 'Save'
        end
        sleep(1)
        click_on 'Save'
      end

      def open_calendar_events
        find('.nav-list').find('a', text: 'Calendar events').click
      end

      def present?
        [@participant, @title].each do |i|
          has_css?('tr', text: i)
        end
        pt_row.has_css?('.start_field', text: @start_date.strftime('%d %b'))
        compare_time(@start_time, '.start_field')
        pt_row.has_css?('.end_field', text: @end_date.strftime('%d %b'))
        compare_time(@end_time, '.end_field')
      end

      private

      def pt_row
        find('tr', text: @participant)
      end

      def compare_time(time, field)
        exp_hour = time.strftime('%H')
        act_hour = pt_row.find(field).text[7..11].gsub(/:\w+/, '')
        sub_hour = act_hour.to_i - exp_hour.to_i

        exp_min = time.strftime('%M')
        act_min = pt_row.find(field).text[7..11].gsub(/\w+:/, '')
        sub_min = act_min.to_i - exp_min.to_i

        if sub_hour.between?(0, 1) && sub_min.between?(0, 1)
          pt_row.find(field,
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
