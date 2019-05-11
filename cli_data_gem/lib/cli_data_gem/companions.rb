# Class to create companion objects

class CliDataGem::Companions
    attr_accessor :name, :location, :quote, :race, :gender, :role

    @@all = []

    def initialize(companions_hash)
        companions_hash.each do |key, value|
            self.send(("#{key}="), value)
        end
        @@all << self
    end
    
    def self.create_from_collection(companions_array)
        companions_array.each do |companion|
            self.new(companion)
        end                
    end

    def self.all
        @@all
    end    
        

end