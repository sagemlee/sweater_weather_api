class MunchieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start_location, :end_location, :travel_time, :destination_forecast, :restaurant
end 