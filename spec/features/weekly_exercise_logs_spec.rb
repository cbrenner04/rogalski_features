# filename: ./spec/features/weekly_exercise_logs_spec.rb

require './spec/support/weekly_exercise_log_helper'

feature 'Weekly Exercise Logs' do
  scenario 'Participant completes a weekly exercise log' do
    participant_7.sign_in
    pt_weekly_log.open
    pt_weekly_log.start
    # this may blow up due to the order in which the form could be filled out
    pt_weekly_log.complete

    # check admin page for data
    participant_7.sign_out
    admin.sign_in
    user_weekly_log.open
    expect(user_weekly_log).to have_participant_weekly_log

    # check details
    user_weekly_log.open_details
    expect(user_weekly_log).to have_participant_weekly_log_details
  end
end
