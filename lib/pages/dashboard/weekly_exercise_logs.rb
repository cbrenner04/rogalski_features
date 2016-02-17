class Dashboard
  # page object for weekly exercise logs
  class WeeklyExerciseLogs
    include Capybara::DSL

    def initialize(user)
      @user ||= user
    end

    def open
      find('.nav-list').find('a', text: 'Weekly Exercise Logs').click
    end

    def has_participant_weekly_log?
      within('tr', text: @user) do
        find('td', text: 'Additional Comments')
        now = Date.today
        sunday = now - now.wday
        monday = sunday - 6
        start_date = "#{monday.strftime('%B %d, %Y')} 00:00"
        find('td', text: start_date)
        find('td', text: 'ExerciseLogDetail #1, ExerciseLogDetail #2, and')
      end
    end

    def open_details
      find('.nav-list').find('a', text: 'Weekly Exercise Log Details').click
    end

    def has_participant_weekly_log_details?
      has_css?('tr', text: @user, count: 3)
    end
  end
end
