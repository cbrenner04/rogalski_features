# filename: ./spec/support/feature_helper.rb

require './lib/pages/dashboard'
require './lib/pages/home'
require './lib/pages/user_dashboard/user'

def dashboard
  @dashboard ||= Dashboard.new
end

def home
  @home ||= Home.new
end

def admin
  @admin ||= UserDashboard::User.new(generic_admin)
end
