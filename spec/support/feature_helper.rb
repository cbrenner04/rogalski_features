# filename: ./spec/support/feature_helper.rb

# require and instantiate page object
Dir['./lib/pages/**/*.rb'].each { |file| require file }

def log_in
  @log_in ||= LogIn.new
end

def home
  @home ||= Home.new
end

def dashboard
  @dashboard ||= Dashboard.new
end

def users
  @users ||= Dashboard::Users.new
end

def add_new_user
  @add_new_user ||= Dashboard::Users::AddNew.new
end

def edit_user
  @edit_user ||= Dashboard::Users::Edit.new
end

def user_info
  @user_info ||= Dashboard::Users::Info.new
end

def user_assignments
  @user_assignments ||= Dashboard::Users::Assignments.new
end

def user_calendar_events
  @user_calendar_events ||= Dashboard::Users::CalendarEvents.new
end

def user_videos
  @user_videos ||= Dashboard::Videos.new
end

def participants
  @participants ||= Home::Participants.new
end

def participant_videos
  @participant_videos ||= Home::Participants::Videos.new
end
