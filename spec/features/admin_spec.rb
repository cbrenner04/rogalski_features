# filename: ./spec/features/admin_spec.rb

require './spec/support/admin_helper.rb'

feature 'Admin' do
  background do
    user.sign_in
    user.open_users
  end

  scenario 'Admin views current users' do
    expect(user).to be_present
  end

  scenario 'Admin creates another admin' do
    user.open_add_new_tab
    new_admin.create_admin
    expect(new_admin).to be_present

    # checks new user has proper permissions
    user.log_out
    new_admin.sign_in
    expect(dashboard).to be_visible

    user.visit_participants
    expect(home).to be_visible
  end

  scenario 'Admin creates a participant' do
    user.open_add_new_tab
    new_participant.create_participant
    user.assert_on_page
    expect(new_participant).to be_present

    # checks new participant has proper permissions
    user.log_out
    new_participant.sign_in
    expect(home).to be_visible

    expect { user.visit_admin }.to raise_error(Capybara::ElementNotFound)
  end

  scenario 'Admin adds an assignment to a participant' do
    user.open_edit_page_for('preload_pt_101')
    new_assignment.open_assignments_tab
    new_assignment.create_assignment
    new_assignment.save
    user.open_info_page_for('preload_pt_101')
    expect(participant_1).to have_assignment

    # check assignments tab for new assignment
    new_assignment.open
    expect(new_assignment).to be_present

    # sign in as participant and check for assignment
    user.log_out
    participant_1.sign_in
    expect(participant_exercise).to be_present
  end

  scenario 'Admin schedules a session with a participant' do
    user.open_edit_page_for('preload_pt_102')
    session.schedule
    user.open_info_page_for('preload_pt_102')
    expect(participant_2).to have_session

    # check calendar events for new session
    session.open_calendar_events
    expect(session).to be_present

    # sign in as participant and check for session
    user.log_out
    participant_2.sign_in
    participant_session.open
    expect(participant_session).to be_present
  end

  scenario 'Admin assigns a video to a participant' do
    user.open_edit_page_for('preload_pt_103')
    video.assign
    user.open_info_page_for('preload_pt_103')
    expect(participant_3).to have_video

    # check videos for new video
    video.open
    expect(video).to be_present

    # sign in as participant and check for video
    user.log_out
    participant_3.sign_in
    participant_video.open
    expect(participant_video).to be_present
  end
end
