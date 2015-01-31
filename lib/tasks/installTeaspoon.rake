namespace :install do
  desc 'install the teaspoon test runner'
  task :teaspoon => :environment do 
    exec 'rails generate teaspoon:install --framework=mocha --coffee'
  end
end
