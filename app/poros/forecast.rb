require 'time'
class Forecast 
    attr_reader :id, :date, :time, :temp, :temp_high, :temp_low,
    :sunrise, :sunset, :feels_like, :humidity, :uvi, :visibility, 
    :description, :icon, :hours, :days
    # has_many :days 
    # has_many :hours
    def initialize(info)
        @id = info[:current][:dt]
        @date = info[:current][:dt]
        @time = info[:current][:dt]
        @temp = info[:current][:temp]
        #@temp_high = info[:current][:temp][:max]
        #@temp_low = info[:current][:temp][:min]
        @sunrise = info[:current][:sunrise]
        @sunset = info[:current][:sunrise]
        @feels_like = info[:current][:feels_like]
        @humidity = info[:current][:humidity]
        @uvi = info[:current][:uvi]
        @visibility = info[:current][:visibility]
        @description = info[:current][:weather].first[:description]
        @icon = info[:current][:weather].first[:icon]

        #for each
        @hours = info[:hourly][0..7].map do |hour|
            time_in_hours = Time.at(hour[:dt])

            {"time" => time_in_hours.strftime("%I:%M %p"),  
            "temp" => hour[:temp],
            "icon" => hour[:weather].first[:icon]}
        end 
        # @date = info[:dt]
        # @temp_high = info[:temp][:max]
        # @temp_low  =  info[:temp][:min]
        # @description = info[:weather][:description]
        # @icon = info[:weather][:icon]
        # @rain = info[:rain]

        #for each hour 
        @days = info[:daily][0..4].map do |day|
           weekday = Time.at(day[:dt])
           {"day" => weekday.strftime("%A"),
           "temp_high" => day[:temp][:max],
           "temp_low" => day[:temp][:min],
           "description" => day[:weather].first[:description],
           "icon" => day[:weather].first[:icon],
           "rain" => day[:rain] 
        }
    end 
    binding.pry
        # @time = info[:dt]
        # @temp = info[:temp]
        # @description = info[:weather].first[:description]
        # @icon = info[:weather].first[:icon]

    end 
    
end 