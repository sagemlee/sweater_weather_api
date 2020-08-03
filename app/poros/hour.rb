class Hour 
    attr_reader :time, :temp, :description, :icon 
    belongs_to :forecast
    def initialize(info)
        @time = info[:dt]
        @temp = info[:temp]
        @description = info[:weather].first[:description]
        @icon = info[:weather].first[:icon]
    end 
end 