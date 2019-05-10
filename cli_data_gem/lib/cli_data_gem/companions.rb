# Class to create companion objects

class Companions
    attr_accessor :name, :location, :race, :role, :voice

    @@all = []

    def initialize(companions_hash)
        companions_hash.each do |key, value|
            self.send(("#{key}="), value)
        end
        @@all << self        
    end    

end