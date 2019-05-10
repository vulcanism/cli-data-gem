require 'open-uri'
require 'nokogiri'
require 'pry'

# Scrapes name and detail data from given url
class Scraper

    PAGE_URL = "https://dragonage.fandom.com/wiki/Companions_and_advisors_(Inquisition)"

    # Gets character name
    def self.scrape_name
        doc = Nokogiri::HTML(open(PAGE_URL))
        binding.pry
        
        # New plan, grabbing from the "first encounter" table at the bottom
        # do each with index, if statement--if index is 0 (the table header), don't save, but if it's greater than zero, save
            
        doc.css("table.sortable").css("tr").each_with_index do |character|
            name = character.css("a").first.text
                    
        end
        
    end

    # Gets character details
    def self.scrape_details

    end    

end