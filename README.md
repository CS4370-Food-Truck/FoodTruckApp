 ***FoodTruckApp***
                                                                    
Creators James Feliciano,  Arturo Valenzuela Montes, Juliet Smith,  Michelle Thornburgh, Karent Correa

**REQUIREMENTS**
  1. Ruby version 3.1.2
  2. SQLite3 3.39.3 or greater
  3. Rails version 7.0.3.1
  4. A google maps API key



**Installing Ruby** 


Run the command:

  ``sudo apt-get install ruby-full``
  
On platforms other than linux, consult ruby's official documentation: https://www.ruby-lang.org/en/documentation/installation/
    

**Installing SQLite3** 

Run the command:

  ``sudo apt install sqlite3``
  
To install SQLite3 on other systems consult the sqlite downloads page. https://www.sqlite.org/index.html
On windows you may need to edit your PATH.

Confirm your installation of sqlite3 using:
  
  ``sqlite3 --version``


** Installing Ruby on Rails **

You will want to install Ruby on Rails through ruby gems

  ``gem install rails``
  
And confirm your installation using

  ``rails --version``


** To run the application ** 

1. Clone repository

2. Navigate your command line interface to where you cloned the repository.

3. Run the following commands:

  ``bundle install``
  
  ``rails db:migrate``
  
  ``rails server``
  
  The server should then be running.
  
4. Open a browser window and go to the url:

    http://localhost:3000/
    
    Some elements may not load because of adblocking extensions. Please disable these.
    The map will not function until you insert your google maps API key.
    

**Getting an API KEY**
Go to:
https://developers.google.com/maps
Select "Get started" and follow google's instructions.
You will not be charged for making an API key but you will be charged if your usage exceeds a certain amount.

Run the command:
  ``bundle exec figaro install``
This will create config/application.yml

Inside config/application.yml add the line

``MAP_API: YOUR-API-KEY``
Replace YOUR-API-KEY with your API key.

