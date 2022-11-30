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
  
  ``rails assets:precompile``
  
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
You must restart the server for the changes to config/application.yml go live.


**Getting Notification keys**

You will need a public and private key for the notification system to work properly.
An easy way to do this is using an online generator:
https://web-push-codelab.glitch.me/

You may also use these npm commands to achieve the same thing:

```
npm install -g web-push
web-push generate-vapid-keys
```

In the same place where you put the map API key, add the following lines:

```
NOTIFY_PUBLIC:  YOUR-PUBLIC-KEY
NOTIFY_PRIVATE: YOUR-PRIVATE-KEY
```

Replace YOUR-PUBLIC-KEY and YOUR-PRIVATE-KEY with the public and private keys you got.

In the current version of the program, you will need to manually edit line 47 of show_controller.js because Figaro cannot be easily accessed via javascript.

```
applicationServerKey: urlBase64ToUint8Array(
                  'YOUR-PUBLIC-KEY',
              ),
```

Replace YOUR-PUBLIC-KEY with the public key you got.


**Enabling testing features**

In the same place where you put the map API key, and the notification keys, add the following line:

```TESTING: "true"```

This will enable the testing features of the web application.
You should not have this enabled if you are hosting the website to the public because it allows for anyone to access testing features.

