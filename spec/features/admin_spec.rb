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
    user = { email: ENV['Admin'] }
    expect(users).to have_user(user)
  end

  scenario 'Admin creates another admin' do
    users.open
    add_new_user.open
    admin = { email: 'fake@example.com', password: 'password' }
    add_new_user.create_admin(admin)
    expect(users).to have_user(admin)
  end

  scenario 'Admin creates a participant' do
    users.open
    add_new_user.open
    participant = { email: 'participant_1@example.com',
                    display_name: 'Participant 1', password: 'password',
                    study_id: 'pt1', phone: '202-555-0163',
                    start_date: Date.today }
    add_new_user.create_participant(participant)
    users.assert_on_page
    expect(users).to have_user(participant)
  end

  scenario 'Admin adds an assignment to a participant' do
    users.open
    edit_user.open_for('preload_pt_1')
    assignment = { title: 'New assignment', participant: 'preload_pt_1',
                   instructions: 'Assignment Body' }
    edit_user.create_assignment(assignment)
    user_info.open_for('preload_pt_1')
    expect(user_info).to have_assignment(assignment)
  end

  scenario 'Admin schedules a session with a participant' do
    users.open
    edit_user.open_for('preload_pt_2')
    session = { title: 'New session', start_date: Date.today + 1,
                start_time: Time.now, end_date: Date.today + 1,
                end_time: Time.now + 1, instructions: 'Session Instructions' }
    edit_user.schedule_session(session)
    user_info.open_for('preload_pt_2')
    expect(user_info).to have_session(session)
  end

  scenario 'Admin assigns a video to a participant' do
    users.open
    edit_user.open_for('preload_pt_3')
    video = { video_url: 'fake/url/', title: 'New Video',
              description: 'Video description', resource: 'Video resource' }
    edit_user.assign_video(video)
    user_info.open_for('preload_pt_3')
    expect(user_info).to have_video(video)
  end
end
