# filename: Rakefile

# load development version of app locally with selenium_fixtures
# this assumes the directory for this suite is in the same directory as the app

desc "Set up and start 'Comunication Bridge' for testing locally"

task :load_app_local do
  Dir.chdir('../rogalski/') do
    system('rake db:drop db:create db:migrate')
    system('rake seed_selenium:fixtures')
    system('rails s')
  end
end
