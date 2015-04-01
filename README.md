This is a Ruby on Rails application. 
Instructions for getting it to work on a *nix OS:
* ```git clone https://github.com/CuddlySquirrel/example-Rails-app-with-Angular-and-D3.git``` to get the code on your box
* Fire up a shell and navigate to the dir where you cloned the code
* execute ```bundle install```
* address any errors you encounter with the ```gem``` and/or package manager on your box.  Paste the error text into a web search engine for more detailed instructions. 
* setup your postgres database 
  * ```sudo -u postgres createuser $USER``` creates the database user
  * ```sudo -u postgres psql -d template1``` log into the database
  * ```alter role YOUR_USER_NAME with createdb;``` update permissions; YOUR_USER_NAME is equal to the value of the $USER environment variable; ```echo $USER``` at the shell to see it
  * ```rake db:create db:migrate``` create and migrate the databases
* execute ```rails s``` from within the dir where you cloned the code to create the rails server
* use a web browser to access the application by navigating to the url indicated by the output of the ```rails s``` command (probably something like http://0.0.0.0:3000 or http://localhost:3000)

