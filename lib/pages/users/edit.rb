# page object for editing user information
class Users
  class Edit
    include Capybara::DSL

    def open_for(user)
      find('tr', text: user).find('.icon-pencil').click
    end

    def create_assignment(hash)
      find('legend', text: 'Assignments').click
      sleep(1)
      click_on 'Add a new Assignment'
      first('input').set(hash[:title])
      first('.input-append').find('.ui-icon').click
      pt_links = page.all('a', text: hash[:participant])
      pt_links[1].click
      within_frame(find('.wysihtml5-sandbox')) do
        find('body').set(hash[:instructions])
      end
      click_on 'Save'
    end

    def schedule_session(hash)
      find('legend', text: 'Schedule session').click
      sleep(1)
      click_on 'Add a new Calendar event'
      sleep(1)
      within('.modal') do
        fill_in 'calendar_event[title]', with: hash[:title]
        date_pickers = page.all('.hasDatepicker')
        time_pickers = page.all('.hasTimepicker')
        date_pickers[0].set(hash[:start_date])
        time_pickers[0].set(hash[:start_time])
        date_pickers[1].set(hash[:end_date])
        time_pickers[1].set(hash[:end_time])
        within_frame(find('.wysihtml5-sandbox')) do
          find('body').set(hash[:instructions])
        end
        find('.modal-header-title').click
        click_on 'Save'
      end
      sleep(1)
      click_on 'Save'
    end

    def assign_video(hash)
      find('legend', text: 'Assign videos').click
      click_on 'Add a new Video'
      sleep(1)
      within('.modal') do
        fill_in 'video[url]', with: hash[:video_url]
        fill_in 'video[title]', with: hash[:title]
        fill_in 'video[description]', with: hash[:description]
        fill_in 'video[resource]', with: hash[:resource]
        click_on 'Save'
      end
      sleep(1)
      click_on 'Save'
    end
  end
end
