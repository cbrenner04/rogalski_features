# frozen_string_literal: true
# filename: ./spec/features/participants_spec.rb

require './spec/support/participants_helper'

feature 'Participants' do
  scenario 'Participant navigates to Contact/Help page' do
    participant_8.sign_in
    contact_help.open
    expect(contact_help).to be_visible
    contact_help.play_video
    participant_8.return_home
    expect(participant_8).to have_todo_list
  end

  scenario 'Participant checks the calendar for events' do
    participant_9.sign_in
    calendar.open
    expect(calendar).to have_event
    calendar.open_event_detail
    expect(calendar).to have_event_detail
    calendar.close_event_detail
    calendar.increment_calendar
    expect(calendar).to have_next_month
    calendar.return_to_today
    expect(calendar).to have_month
    calendar.decrement_calendar
    expect(calendar).to have_previous_month
    calendar.return_to_today
    expect(calendar).to have_month

    calendar.switch_to_week
    expect(calendar).to have_week
    expect(calendar).to have_event
    calendar.open_event_detail
    expect(calendar).to have_event_detail
    calendar.close_event_detail
    calendar.increment_calendar
    expect(calendar).to have_next_week
    calendar.return_to_today
    expect(calendar).to have_week
    calendar.decrement_calendar
    expect(calendar).to have_previous_week
    calendar.return_to_today
    expect(calendar).to have_week

    calendar.switch_to_day
    expect(calendar).to have_day
    expect(calendar).to have_event
    calendar.open_event_detail
    expect(calendar).to have_event_detail
    calendar.close_event_detail
    calendar.increment_calendar
    expect(calendar).to have_next_day
    calendar.return_to_today
    expect(calendar).to have_day
    calendar.decrement_calendar
    expect(calendar).to have_previous_day
    calendar.return_to_today
    expect(calendar).to have_day

    calendar.switch_to_month
    expect(calendar).to have_month
    participant_9.return_home
    expect(participant_9).to have_todo_list
  end

  scenario 'Participant navigates to Connect page' do
    participant_10.sign_in
    connect.open
    expect(connect).to have_details
  end
end
