# filename: ./spec/features/admin_spec.rb

feature 'Admin' do
  background do
    home.log_in_as(generic_admin)
  end

  scenario 'Admin logs in successfully' do
    expect(admin_home).to be_visible
  end

  scenario 'Admin views current users' do
    users.open
    expect(users).to have_user(generic_admin)
  end

  scenario 'Admin creates another admin' do
    users.open
    add_new_user.open
    new_admin = { email: 'fake@example.com', password: 'password' }
    add_new_user.create_admin(new_admin)
    expect(users).to have_user(new_admin)

    # checks new user has proper permissions
    admin_home.log_out
    home.log_in_as(new_admin)
    expect(admin_home).to be_visible

    admin_home.visit_participants
    expect(participant_home).to be_visible
  end

  scenario 'Admin creates a participant' do
    users.open
    add_new_user.open
    new_participant = { email: 'participant_1@example.com',
                        display_name: 'Participant 1', password: 'password',
                        study_id: 'pt1', phone: '202-555-0163',
                        start_date: Date.today }
    add_new_user.create_participant(new_participant)
    users.assert_on_page
    expect(users).to have_user(new_participant)

    # checks new participant has proper permissions
    admin_home.log_out
    home.log_in_as(new_participant)
    expect(participant_home).to be_visible

    expect { admin_home.visit_admin }.to raise_error(Capybara::ElementNotFound)
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
