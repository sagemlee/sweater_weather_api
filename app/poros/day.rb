class Day 
    attr_reader :date, :temp_high, :temp_low, :description,
    :icon, :rain
    belongs_to :forecast
     def initialize(info)
        @date = info[:dt]
        @temp_high = info[:temp][:max]
        @temp_low  =  info[:temp][:min]
        @description = info[:weather][:description]
        @icon = info[:weather][:icon]
        @rain = info[:rain]
end 