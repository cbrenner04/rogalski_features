# page object
class Dashboard
  # for Users
  class Users
    # for editing user information
    class Edit
      include Capybara::DSL

      def open_for(user)
        find('tr', text: user).find('.icon-pencil').click
      end

      def open_assignments_tab
        find('legend', text: 'Assignments').click
        sleep(1)
      end

      def create_assignment(assignment)
        click_on 'Add a new Assignment'
        first('input').set(assignment[:title])
        first('.input-append').find('.ui-icon').click
        find('.ui-autocomplete')
          .find('a', text: assignment[:participant]).click
        within_frame(find('.wysihtml5-sandbox')) do
          find('body').set(assignment[:instructions])
        end
      end

      def save
        click_on 'Save'
      end

      def schedule_session(session)
        find('legend', text: 'Schedule session').click
        sleep(1)
        click_on 'Add a new Calendar event'
        sleep(1)
        within('.modal') do
          fill_in 'calendar_event[title]', with: session[:title]
          date_pickers = page.all('.hasDatepicker')
          time_pickers = page.all('.hasTimepicker')
          date_pickers[0].set(session[:start_date])
          time_pickers[0].set(session[:start_time])
          date_pickers[1].set(session[:end_date])
          time_pickers[1].set(session[:end_time])
          within_frame(find('.wysihtml5-sandbox')) do
            find('body').set(session[:instructions])
          end
          find('.modal-header-title').click
          click_on 'Save'
        end
        sleep(1)
        click_on 'Save'
      end

      def assign_video(video)
        find('legend', text: 'Assign videos').click
        click_on 'Add a new Video'
        sleep(1)
        within('.modal') do
          fill_in 'video[url]', with: video[:video_url]
          fill_in 'video[title]', with: video[:title]
          fill_in 'video[description]', with: video[:description]
          fill_in 'video[resource]', with: video[:resource]
          click_on 'Save'
        end
        sleep(1)
        click_on 'Save'
      end
    end
  end
end
