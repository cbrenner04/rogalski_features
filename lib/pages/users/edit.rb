# page object for editing user information
class Users
  class Edit
    include Capybara::DSL

    def open_for(user)
      find('tr', text: user).find('.icon-pencil').click
    end

    def create_assignment(title, participant, inst)
      find('legend', text: 'Assignments').click
      click_on 'Add a new Assignment'
      first('input').set(title)
      first('.input-append').find('.ui-icon').click
      pt_links = page.all('a', text: participant)
      pt_links[1].click
      within_frame(find('.wysihtml5-sandbox')) { find('body').set(inst) }
      click_on 'Save'
    end

    def sched_session(title, start_date, start_time, end_date, end_time, inst)
      find('legend', text: 'Schedule session').click
      click_on 'Add a new Calendar event'
      within('.modal') do
        fill_in 'calendar_event[title]', with: title
        date_pickers = page.all('.hasDatepicker')
        time_pickers = page.all('.hasTimepicker')
        date_pickers[0].set(start_date)
        time_pickers[0].set(start_time)
        date_pickers[1].set(end_date)
        time_pickers[1].set(end_time)
        within_frame(find('.wysihtml5-sandbox')) { find('body').set(inst) }
        find('.modal-header-title').click
        click_on 'Save'
      end
      sleep(1)
      click_on 'Save'
    end

    def assign_video(url, title, description, resource)
      find('legend', text: 'Assign videos').click
      click_on 'Add a new Video'
      within('.modal') do
        fill_in 'video[url]', with: url
        fill_in 'video[title]', with: title
        fill_in 'video[description]', with: description
        fill_in 'video[resource]', with: resource
        click_on 'Save'
      end
      sleep(1)
      click_on 'Save'
    end
  end
end
