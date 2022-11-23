class Truck < ApplicationRecord
  validates :name, presence: true
  
  before_save{|truck|
    str = '{'
    if truck.schedule.include?("Monday")
      str += '"Monday": true,'
    else
      str += '"Monday": false,'
    end
    if truck.schedule.include?("Tuesday")
      str += '"Tuesday": true,'
    else
      str += '"Tuesday": false,'
    end
    if truck.schedule.include?("Wednesday")
      str += '"Wednesday": true,'
    else
      str += '"Wednesday": false,'
    end
    if truck.schedule.include?("Thursday")
      str += '"Thursday": true,'
    else
      str += '"Thursday": false,'
    end
    if truck.schedule.include?("Friday")
      str += '"Friday": true,'
    else
      str += '"Friday": false,'
    end
    if truck.schedule.include?("Saturday")
      str += '"Saturday": true,'
    else
      str += '"Saturday": false,'
    end
    if truck.schedule.include?("Sunday")
      str += '"Sunday": true,'
    else
      str += '"Sunday": false,'
    end
    srt += '}'
  truck.schedule = str
  }
end
