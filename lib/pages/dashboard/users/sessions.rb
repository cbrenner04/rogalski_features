class Dashboard
  class Users
    # page object for editing user information
    class Sessions
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
        pt_row = find('tr', text: @participant)
        pt_row.has_css?('.start_field', text: @start_date.strftime('%d %b'))
        pt_row.has_css?('.start_field', text: @start_time.strftime('%H:M'))
        pt_row.has_css?('.end_field', text: @end_date.strftime('%d %b'))
        pt_row.has_css?('.end_field', text: @end_time.strftime('%H:%M'))
      end
    end
  end
end
