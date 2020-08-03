class Forecast 

    def initialize(info)
        @date = info[:dt]
        @time = info[:dt]
        @temp = info[:temp][:day]
        @temp_high = info[:temp][:max]
        @temp_low = info[:temp][:min]
        @sunrise = info[:sunrise]
        @sunset = info[:sunrise]
        @feels_like = info[:feels_like][:day]
        @humidity = info[:humidity]
        @uvi = info[:uvi]
        @visibility = info[:visibility]
        @description = info[:weather][:description]
        @icon = info[:weather][:icon]
    end 
end 