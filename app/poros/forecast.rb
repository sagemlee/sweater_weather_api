require 'time'
class Forecast 
    attr_reader :id, :time, :temp, :temp_high, :temp_low,
    :sunrise, :sunset, :feels_like, :humidity, :uvi, :visibility, 
    :description, :icon, :hours, :days, :city, :country
  
    def initialize(info, city, country)
        current_time = Time.at(info[:current][:dt])
        @id = info[:current][:dt]
        @city = city
        @country = country
        @time = current_time.strftime("%l:%M %p, %B %-d")
        @temp = info[:current][:temp]
        @temp_high = info[:daily].first[:temp][:max]
        @temp_low = info[:daily].first[:temp][:min]
        @sunrise = Time.at(info[:current][:sunrise]).strftime("%l:%M %p")
        @sunset = Time.at(info[:current][:sunset]).strftime("%l:%M %p")
        @feels_like = info[:current][:feels_like]
        @humidity = info[:current][:humidity]
        @uvi = info[:current][:uvi]
        @visibility = info[:current][:visibility]
        @description = info[:current][:weather].first[:description]
        @icon = "http://openweathermap.org/img/wn/#{info[:current][:weather].first[:icon]}@2x.png"
        @hours = format_hours(info)
        @days = format_days(info)      
    end 

    private 

    def format_hours(info)
        info[:hourly][0..7].map do |hour|
            time_in_hours = Time.at(hour[:dt])
            {"time" => time_in_hours.strftime("%l:%M %p"),  
            "temp" => hour[:temp],
            "icon" => "http://openweathermap.org/img/wn/#{hour[:weather].first[:icon]}@2x.png"} 
        end 
    end 

    def format_days(info) 
        info[:daily][1..5].map do |day|
           weekday = Time.at(day[:dt])
           {"day" => weekday.strftime("%A"),
           "temp_high" => day[:temp][:max],
           "temp_low" => day[:temp][:min],
           "description" => day[:weather].first[:description],
           "icon" => "http://openweathermap.org/img/wn/#{day[:weather].first[:icon]}@2x.png",
           "rain" => day[:rain] 
            }
        end
    end 
end 