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
end
