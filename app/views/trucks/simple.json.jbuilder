json.array! @trucks do |truck|
  json.id truck.id
  json.name truck.name
  json.longitude truck.longitude
  json.latitude truck.latitude
end
