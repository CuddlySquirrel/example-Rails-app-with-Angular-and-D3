def showRakeRoutes
  puts "\n\n# rake routes...\n\n"
  puts `rake routes`
  puts ''
end

def showDynamicRoutes
  dirApp =  "#{File.expand_path(".")}/app"
  dirVs = "#{dirApp}/views"
  dirCs = "#{dirApp}/controllers"
  suffixC = '_controller.rb'
  dirsCs = Dir.glob("#{dirCs}/*#{suffixC}").map{|x|File.basename(x).sub(suffixC,'')}
  puts "\n\n# dynamic routes..."
  dirsCs.each do |dirC|
    puts ''
    Dir.glob("#{dirVs}/#{dirC}/*").each do |fileView|
      bnFileView = File.basename(fileView,File.extname(fileView))
      puts "#{dirC}/#{bnFileView}"
    end
  end
end

namespace :routes do
  desc 'show all the available routes'
  task :all => :environment do 
    showRakeRoutes
    showDynamicRoutes
  end
end
