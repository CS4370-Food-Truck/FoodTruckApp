 ***FoodTruckApp***
                                                                    
Creators James Feliciano,  Arturo Valenzuela Montes, Juliet Smith,  Michelle Thornburgh, Karent Correa

** Requirements **
    1. Ruby version 3.1.0
    2. Rails version 7.0.3.1
    3. A Google API key
    4. These features enabled for your API: 
        - Maps Javascript API
        - Geocode API
        - Geolocation API
        - Places API
** Getting a Google API **
The Google's API is for the map feature of the website. Each project requires its own unique API key. Google will allow you to use thier maps in websites for free. YOu need to put in a card for billing to use one, but THey wont charge your card unless you surpass their free limit. (For example having more than 12 API keys). 

This is the link for the Google Maps Platform:
    https://mapsplatform.google.com/

These are the links to videos to set up your billing information and getting an API key. 
    1. https://www.youtube.com/watch?v=uINleRduCWM
    2. https://www.youtube.com/watch?v=2_HZObVbe-g&t=108s

Once you have your API key you can go into the 
    SPECIFY WHERE WE WILL KEEP THE API KEY
    and replace you_API_key with the API key you just got.

** Installing Ruby on Rails **
Falloing the first 28 minutes of this video is one of the least hassle ways to get the enviroment to work. Especially for Windows users. 
    https://www.youtube.com/watch?v=fmyvWz5TUWg

See also the PDF file Installing RoR that is also in the repository. This was provided by Professor Steve Beaty to the Web Application Development Fall 2022 Class. Taken from the book Agile Web Development with Rails 7, beta version. 

** To run the application ** 

1.Clone repository

2. Open a terminal/command of your choosing

3. Navigate to the correct folder/path. The last part of you path should be into the    folder /FoodTruckApp

4. To make sure everying is working properly you should run a test first. Use
the command: rails test
This may take a few mintues

5. To start the server on your computer use the command: rails server (or rails s)

6. With yoyur browser use this URL http://localhost:3000. This will display the map.

7. If you want to browse the database use the URL http://localhost:3000/trucks.
