require 'open-uri'
require 'nokogiri'
require 'pry'

# Scrapes name and detail data from given url
class Scraper

    PAGE_URL = "https://dragonage.fandom.com/wiki/Companions_and_advisors_(Inquisition)"

    # Gets character name and location
    def self.scrape_name
        doc = Nokogiri::HTML(open(PAGE_URL))
        # binding.pry
        companions_hash = {}
        companions = []                
                
        # do each with index, if statement--if index is 0 (the table header), don't save, but it's greater than zero, save
        # doc.css("table.sortable").css("tr")[1].css("td")[1].text -> location    
        
        doc.css("table.sortable").css("tr").each do |companion|           
                   
             # if index > 0
             companions_hash = {
             :name => companion.css("a").first.text,
             :location => companion.css("td")[1].text, # (solve the \n thing later)
             }
             companions << companions_hash                        
             # end                
        end
        companions 
    end

    # Gets character details
    def self.scrape_details
        # Need to somehow open https://dragonage.fandom.com/wiki/#{character_name}
        # base_path = "https://dragonage.fandom.com/wiki/"


    end    

end