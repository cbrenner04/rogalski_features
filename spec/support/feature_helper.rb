# filename: ./spec/support/feature_helper.rb

# require and instantiate page object
Dir['./lib/pages/**/*.rb'].each { |file| require file }

def home
  @home ||= Home.new
end

def admin_home
  @admin_home ||= Home::Admin.new
end

def users
  @users ||= Users.new
end

def add_new_user
  @add_new_user ||= Users::AddNew.new
end

def edit_user
  @edit_user ||= Users::Edit.new
end

def user_info
  @user_info ||= Users::Info.new
end

def participant_home
  @participant_home ||= Home::Participant.new
end
