class Image 
    attr_reader :id, :url
    def initialize(location) 
        @url = ImageService.new.image(location)[:results].first[:urls][:regular]
        @id = ImageService.new.image(location)[:results].first[:id]
    end 
end 