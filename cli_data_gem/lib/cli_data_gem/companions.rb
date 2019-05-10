# Class to create companion objects

class CliDataGem::Companions
    attr_accessor :name, :location, :details

    @@all = []

    def initialize
        @name = name
        @location = location
        @details = details       
    end
    
    def save
        @@all << self
    end


end