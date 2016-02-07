# filename: ./spec/features/admin_spec.rb

require './spec/support/admin_helper.rb'

feature 'Admin' do
  background do
    admin_login.sign_in
  end

  scenario 'Admin logs in successfully' do
    expect(dashboard).to be_visible
  end

  scenario 'Admin views current users' do
    user.open
    expect(user).to be_present
  end

  scenario 'Admin creates another admin' do
    user.open
    user.open_add_new_tab
    new_admin.create_admin
    expect(new_admin).to be_present

    # checks new user has proper permissions
    dashboard.log_out
    new_admin_login.sign_in
    expect(dashboard).to be_visible

    dashboard.visit_participants
    expect(home).to be_visible
  end

  scenario 'Admin creates a participant' do
    user.open
    user.open_add_new_tab
    new_participant.create_participant
    user.assert_on_page
    expect(new_participant).to be_present

    # checks new participant has proper permissions
    dashboard.log_out
    new_participant_login.sign_in
    expect(home).to be_visible

    expect { dashboard.visit_admin }.to raise_error(Capybara::ElementNotFound)
  end

  scenario 'Admin adds an assignment to a participant' do
    user.open
    participant_1.open_edit_page
    new_assignment.open_assignments_tab
    new_assignment.create_assignment
    new_assignment.save
    participant_1.open_info_page
    expect(participant_1).to have_assignment

    # check assignments tab for new assignment
    new_assignment.open
    expect(new_assignment).to be_present

    # sign in as participant and check for assignment
    dashboard.log_out
    participant_1_login.sign_in
    expect(participant_exercise).to be_present
  end

  scenario 'Admin schedules a session with a participant' do
    user.open
    participant_2.open_edit_page
    session.schedule
    participant_2.open_info_page
    expect(participant_2).to have_session

    # check calendar events for new session
    session.open_calendar_events
    expect(session).to be_present

    # sign in as participant and check for session
    dashboard.log_out
    participant_2_login.sign_in
    participant_session.open
    expect(participant_session).to be_present
  end

  scenario 'Admin assigns a video to a participant' do
    user.open
    participant_3.open_edit_page
    video.assign
    participant_3.open_info_page
    expect(participant_3).to have_video

    # check videos for new video
    video.open
    expect(video).to be_present

    # sign in as participant and check for video
    dashboard.log_out
    participant_3_login.sign_in
    participant_video.open
    expect(participant_video).to be_present
  end
end
