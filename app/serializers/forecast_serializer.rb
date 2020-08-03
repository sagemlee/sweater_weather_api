class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :date, :time, :temp, :temp_high, :temp_low,
    :sunrise, :sunset, :feels_like, :humidity, :uvi, :visibility, 
    :description, :icon, :hours, :days, :background_image
    # has_many :hours 
    # has_many :days
end 