# Class to create companion objects

class CliDataGem::Companions
    attr_accessor :name, :location, :details

    @@all = []

    def initialize(companions_hash)
        companions_hash.each do |key, value|
            self.send(("#{key}="), value)
        end
        @@all << self
    end   
    

end