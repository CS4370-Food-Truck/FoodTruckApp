module TrucksHelper
    def format_schedule(x)
        t = JSON.parse(x)
        w = ""
        if t["Monday"] === true
          w += "Mon. "
        end
        if t["Tuesday"] === true
          w += "Tues. "
        end
        if t["Wednesday"] === true
            w += "Wed. "
        end
        if t["Thursday"] === true
            w += "Thurs. "
        end
        if t["Friday"] === true
            w += "Fri. "
        end
        if t["Saturday"] === true
            w += "Sat. "
        end
        if t["Sunday"] === true
            w += "Sun. "
        end
          w
    end
    # Jblss888
    # where I got the idea to use this to format the input:
    # https://stackoverflow.com/questions/591939/how-can-i-format-the-value-shown-in-a-rails-edit-field
    #
    #What the schedule input needs to look like
    #'{"Monday": true, "Tuesday": false, "Wednesday": false, "Thursday": false, "Friday": false, "Saturday": false, "Sunday": false}'

end
