# filename: ./spec/features/weekly_exercise_logs_spec.rb

require './spec/support/weekly_exercise_log_helper'

feature 'Weekly Exercise Logs' do
  scenario 'Participant completes a weekly exercise log' do
    participant_7.sign_in

    expect(participant_7).to have_todo_list_count(3)
    expect(participant_7).to have_incomplete_items_todo
    expect(participant_7).to have_completed_todo_items

    pt_weekly_log.open
    pt_weekly_log.start

    # check that exercise log pre-populates with all
    # exercise names even with special characters
    expect(pt_weekly_log).to have_to_do_list_items

    pt_weekly_log.complete

    expect(participant_7).to have_todo_list_count(2)

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
