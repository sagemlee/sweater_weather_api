class Forecast 
    attr_reader :id, :date, :time, :temp, :temp_high, :temp_low,
    :sunrise, :sunset, :feels_like, :humidity, :uvi, :visibility, 
    :description, :icon
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
    end 
    
end 