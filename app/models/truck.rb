class Truck < ApplicationRecord
  validates :name, presence: true
  
  before_save do
    self.schedule
    str = '{'
    if self.schedule.include?("Monday")
      str += '"Monday": true,'
    else
      str += '"Monday": false,'
    end
    if self.schedule.include?("Tuesday")
      str += '"Tuesday": true,'
    else
      str += '"Tuesday": false,'
    end
    if self.schedule.include?("Wednesday")
      str += '"Wednesday": true,'
    else
      str += '"Wednesday": false,'
    end
    if self.schedule.include?("Thursday")
      str += '"Thursday": true,'
    else
      str += '"Thursday": false,'
    end
    if self.schedule.include?("Friday")
      str += '"Friday": true,'
    else
      str += '"Friday": false,'
    end
    if self.schedule.include?("Saturday")
      str += '"Saturday": true,'
    else
      str += '"Saturday": false,'
    end
    if self.schedule.include?("Sunday")
      str += '"Sunday": true,'
    else
      str += '"Sunday": false,'
    end
    srt += '}'
    self.schedule = str
  end
end
