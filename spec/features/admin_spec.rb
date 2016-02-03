# filename: ./spec/features/admin_spec.rb

feature 'Admin' do
  background do
    home.log_in_as(ENV['Admin'], ENV['Admin_Password'])
  end

  scenario 'Admin logs in successfully' do
    expect(admin).to be_visible
  end

  scenario 'Admin views current users' do
    users.open
    expect(users).to have_user(ENV['Admin'])
  end

  scenario 'Admin creates another admin' do
    users.open
    add_new_user.open
    add_new_user.create_admin('fake@example.com', 'password')
    expect(users).to have_user('fake@example.com')
  end

  scenario 'Admin creates a participant' do
    users.open
    add_new_user.open
    add_new_user
      .create_participant('participant_1@example.com', 'Participant 1',
                          'password', 'pt1', '202-555-0163', Date.today)
    users.assert_on_page
    expect(users)
      .to have_participant('participant_1@example.com', 'Participant 1', 'pt1')
  end

  scenario 'Admin adds an assignment to a participant' do
    users.open
    edit_user.open_for('preload_pt_1')
    edit_user
      .create_assignment('New assignment', 'preload_pt_1', 'Assignment Body')
    user_info.open_for('preload_pt_1')
    expect(user_info).to have_assignment('New assignment')
  end

  scenario 'Admin schedules a session with a participant' do
    users.open
    edit_user.open_for('preload_pt_2')
    date = Date.today + 1
    time = Time.now + 1
    edit_user
      .sched_session('New session', date, Time.now, date, time,
                     'Session Instructions')
    user_info.open_for('preload_pt_2')
    expect(user_info).to have_session('New session')
  end

  scenario 'Admin assigns a video to a participant' do
    users.open
    edit_user.open_for('preload_pt_3')
    edit_user.assign_video('fake/url/', 'New Video', 'Video description',
                           'Video resource')
    user_info.open_for('preload_pt_3')
    expect(user_info).to have_video('New Video')
  end
end
