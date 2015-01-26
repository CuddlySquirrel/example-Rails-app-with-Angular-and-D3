def showRakeRoutes
  puts `rake routes`
end

def showDynamicRoutes
  dirApp =  "#{File.expand_path(".")}/app"
  dirVs = "#{dirApp}/views"
  dirCs = "#{dirApp}/controllers"
  suffixC = '_controller.rb'
  dirsCs = Dir.glob("#{dirCs}/*#{suffixC}").map{|x|File.basename(x).sub(suffixC,'')}
  dirsCs.sort.each do |dirC|
    Dir.glob("#{dirVs}/#{dirC}/*").sort.each do |fileView|
      bnFileView = File.basename(fileView,File.extname(fileView))
      puts "#{dirC}/#{bnFileView}"
    end
  end
end

namespace :routes do
  desc 'show all the available routes'
  task :all => :environment do 
    puts "\n\n# rake routes..."
    showRakeRoutes
    puts "\n\n# dynamic routes..."
    showDynamicRoutes
  end
  desc 'show dynamic routes'
  task :dynamic => :environment do
    showDynamicRoutes
  end
end
