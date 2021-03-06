# frozen_string_literal: true
module UserDashboard
  # page object for weekly exercise logs
  class WeeklyExerciseLogs
    include Capybara::DSL

    def initialize(user)
      @user ||= user
    end

    def open
      find('.sidebar-nav').find('a', text: 'Weekly Exercise Logs').click
    end

    def has_participant_weekly_log?
      within('tr', text: @user) do
        now = Date.today
        sunday = now - now.wday
        monday = sunday - 6
        start_date = "#{monday.strftime('%B %d, %Y')} 00:00"
        has_css?('td', text: 'Additional Comments') &&
          has_css?('td', text: start_date) &&
          has_css?('a', text: 'ExerciseLogDetail #1')
      end
    end

    def open_details
      find('.sidebar-nav').find('a', text: 'Weekly Exercise Log Details').click
    end

    def has_participant_weekly_log_details?
      has_css?('tr', text: @user, count: 3)
    end
  end
end
