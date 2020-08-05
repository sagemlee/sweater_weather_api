class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :time, :temp, :temp_high, :temp_low,
    :sunrise, :sunset, :feels_like, :humidity, :uvi, :visibility, 
    :description, :icon, :hours, :days, :city, :country
end 