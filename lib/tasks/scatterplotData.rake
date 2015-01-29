namespace :csv do
  desc 'create views/static/word-list.csv'
  task :scatterplotData => :environment do 
    exec 'scripts/buildScatterplotData.sh'
  end
end
