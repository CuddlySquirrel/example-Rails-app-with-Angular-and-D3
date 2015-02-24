This is a Ruby on Rails application. 
Instructions for getting it to work on a *nix OS:
* git clone the code to your box
* Navigate to the repo dir (wherever you put it (use a shell))
* execute ```bundle install```
* setup your postgres database (ask google if you don't know how)
* run ```rake db:migrate```
* resolve any missing dependencies using ```gem``` and/or your package manager (Mac users use ```brew```)
* execute ```bundle install``` if you installed dependancies
* ensure the result of the ```bundle install``` command indicates success before continuing
* execute ```rails s``` from within the repo dir to create the rails server
* use a web browser to access the application by navigating to the url indicated by the output of the ```rails s``` command (probably something like http://0.0.0.0:3000 or http://localhost:3000)

