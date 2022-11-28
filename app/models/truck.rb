class Truck < ApplicationRecord
  # Truck validations before it saves to database
  validates :name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :schedule, presence: true
  validates :website, presence: true
  validates :menu, presence: true
  validates :longitude, numericality: {in: -104..-106}
  validates :latitude, numericality: {in: 38..40}
end
