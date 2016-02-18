# filename: ./spec/support/weekly_exercise_log_helper.rb

require './lib/pages/dashboard/users'
require './lib/pages/dashboard/weekly_exercise_logs'
require './lib/pages/home/participants'
require './lib/pages/home/participants/weekly_log'

def admin
  @admin ||= Dashboard::Users.new(generic_admin)
end

def participant_7
  @participant_7 ||= Home::Participants.new(preload_pt_107)
end

def pt_weekly_log
  Home::Participants::WeeklyLog.new
end

def user_weekly_log
  Dashboard::WeeklyExerciseLogs.new('preload_pt_107')
end
