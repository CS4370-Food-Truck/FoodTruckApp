# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

##############################################################################
#                                Test Seeds                                  #
##############################################################################
Truck.create(name: "test1", website: "test1", latitude: 39.743287, longitude: -105.005651,  menu: "test1", schedule: '{"Monday": false, "Tuesday": true, "Wednesday": true, "Thursday": true, "Friday": false, "Saturday": false, "Sunday": false}')
Truck.create(name: "test2", website: "test2", latitude: 39.743211, longitude: -105.005428, menu: "test2",  schedule: '{"Monday": true, "Tuesday": false, "Wednesday": false, "Thursday": false, "Friday": true, "Saturday": true, "Sunday": true}')
Truck.create(name: "test3", website: "test3", latitude: 39.741843, longitude: -105.007926, menu: "test3",  schedule: '{"Monday": false, "Tuesday": true, "Wednesday": true, "Thursday": true, "Friday": false, "Saturday": false, "Sunday": false}')
Truck.create(name: "OG Burger", schedule: '{"Monday": false, "Tuesday": true, "Wednesday": true, "Thursday": true, "Friday": false, "Saturday": false, "Sunday": false}', website: "https://ogburgers.co/", latitude: 39.743287, longitude: -105.005651,  menu: "https://ogburgers.co/menu")
Truck.create(name: "Mac N' Noodles", schedule: '{"Monday": false, "Tuesday": false, "Wednesday": true, "Thursday": false, "Friday": false, "Saturday": false, "Sunday": false}', website: "https://macnnoodles.com/", latitude: 39.743287, longitude: -105.005651,  menu: "https://macnnoodles.com/menu/")
Truck.create(name: "Breck Brew", schedule: '{"Monday": false, "Tuesday": false, "Wednesday": true, "Thursday": false, "Friday": false, "Saturday": false, "Sunday": false}', website: "https://www.breckbrew.com/", latitude: 39.743287, longitude: -105.005651,  menu: "https://www.breckbrew.com/visit/littleton/food-truck-menu/")
Truck.create(name: "R & B Tacos", schedule: '{"Monday": false, "Tuesday": false, "Wednesday": false, "Thursday": true, "Friday": false, "Saturday": false, "Sunday": false}', website: "https://www.randbtacosandgrill.com/", latitude: 39.743287, longitude: -105.005651,  menu: "https://www.randbtacosandgrill.com/")
Truck.create(name: "Bandwagon Sandwich CO", schedule: '{"Monday": false, "Tuesday": true, "Wednesday": false, "Thursday": false, "Friday": false, "Saturday": false, "Sunday": false}', website: "https://www.bandwagonsandwichco.com", latitude: 39.741843, longitude: -105.007926, menu: "https://www.bandwagonsandwichco.com/menus")
Truck.create(name: "Original by Greeks", schedule: '{"Monday": false, "Tuesday": false, "Wednesday": true, "Thursday": false, "Friday": false, "Saturday": false, "Sunday": false}', website: "https://www.originaldenver.com/", latitude:39.743211, longitude: -105.005651, menu: "https://www.originaldenver.com/menus")
Truck.create(name: "Downtown Fingers", schedule: '{"Monday": false, "Tuesday": false, "Wednesday": false, "Thursday": true, "Friday": false, "Saturday": false, "Sunday": false}', website: "https://www.downtownfingers.com/", latitude:39.743287, longitude: -105.005651, menu: "https://www.downtownfingers.com/menu")
Truck.create(name: "Lucky Mary's", schedule: '{"Monday": true, "Tuesday": false, "Wednesday": false, "Thursday": false, "Friday": false, "Saturday": false, "Sunday": false}', website: "http://www.luckymarys.com/home.html", latitude:39.743287, longitude: -105.005651, menu:"http://www.luckymarys.com/dessert-trailer.html")
Truck.create(name: "Colorado Pig Rig", schedule: '{"Monday": true, "Tuesday": false, "Wednesday": false, "Thursday": false, "Friday": false, "Saturday": false, "Sunday": false}', website: "https://coloradopigrig.com/", latitude:39.743287, longitude: -105.005651, menu: "https://coloradopigrig.com/menu")
Truck.create(name: "Mile High Cheesesteaks", schedule: '{"Monday": true, "Tuesday": false, "Wednesday": false, "Thursday": false, "Friday": false, "Saturday": false, "Sunday": false}', website: "https://milehighcheesesteaks.com/", latitude:39.743287, longitude: -105.005651, menu:"https://milehighcheesesteaks.com/menu/")
Truck.create(name: "Burger Bus", schedule: '{"Monday": true, "Tuesday": false, "Wednesday": false, "Thursday": false, "Friday": false, "Saturday": false, "Sunday": false}', website: "https://theburgerbus.com/", latitude:39.743287, longitude: -105.005651, menu: "https://theburgerbus.com/menu/")
Truck.create(name: "Hecking Good Bubble Tea", schedule: '{"Monday": true, "Tuesday": false, "Wednesday": false, "Thursday": false, "Friday": false, "Saturday": false, "Sunday": false}', website: "https://hgbubbletea.com/", latitude:39.743287, longitude: -105.005651, menu: "https://hgbubbletea.com/#menu")
Truck.create(name: "Roll it Up Sushi", schedule: '{"Monday": true, "Tuesday": false, "Wednesday": false, "Thursday": false, "Friday": false, "Saturday": false, "Sunday": false}', website: "https://www.rollitupsushitruck.com/", latitude:39.743287, longitude: -105.005651, menu: "https://riusushitruck.square.site/")
Truck.create(name: "Billy's Gorment Hot Dogs", schedule: '{"Monday": true, "Tuesday": false, "Wednesday": false, "Thursday": false, "Friday": false, "Saturday": false, "Sunday": false}', website: "https://billysgourmethotdogs.com/", latitude:39.743287, longitude: -105.005651, menu: "https://billysgourmethotdogs.com/food-menu/")
Truck.create(name: "El Taco Bron", schedule: '{"Monday": true, "Tuesday": false, "Wednesday": false, "Thursday": false, "Friday": false, "Saturday": false, "Sunday": false}', website: "https://www.eltacobron.com/", latitude:39.743287, longitude: -105.005651, menu: "https://www.eltacobron.com/menu")
Truck.create(name: "Ba-nom-a-nom", schedule: '{"Monday": true, "Tuesday": false, "Wednesday": false, "Thursday": false, "Friday": false, "Saturday": false, "Sunday": false}', website: "https://banomanom.com/", latitude: 39.743287, longitude: -105.005651, menu: "https://banomanom.com/our-menu")
Truck.create(name: "Biker Jim's", schedule: '{"Monday": true, "Tuesday": true, "Wednesday": true, "Thursday": true, "Friday": true, "Saturday": false, "Sunday": false}', website: "www.bikerjimsdogs.com", latitude: 39.744155, longitude: -105.006029, menu: "https://bikerjimsdogs.com/our-menu/")

##############################################################################
#                              Actual Seeds                                  #
##############################################################################
