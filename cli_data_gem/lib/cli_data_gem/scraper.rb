require 'open-uri'
require 'nokogiri'
require 'pry'

# Scrapes name and detail data from given url
class Scraper

    PAGE_URL = "https://dragonage.fandom.com/wiki/Companions_and_advisors_(Inquisition)"

    # Gets character name and location
    def self.scrape_name
        doc = Nokogiri::HTML(open(PAGE_URL))
        
        companions_hash = {}
        companions = []                
                
        # do each with index, if statement--if index is 0 (the table header), don't save, but it's greater than zero, save
        # doc.css("table.sortable").css("tr")[1].css("td")[1].text -> location
                
        doc.css("table.sortable").each do |companion|           
             companion.css("tr").each_with_index do |x, index|                      
             if index > 0
              companions_hash = {
              :name => x.css("a").first.text,
              :location => x.css("td")[1].text.gsub("\n",""), # (solve the \n later)
              # :details => scrape for details here
              }
              companions << companions_hash                                     
              end                
        end
    end
    binding.pry
        companions 
    end

    # Gets character details
    def self.scrape_details(index)        
        # def self.scrape_details(index)
        # index should be -1 beforre we get here user says 1 we want 0 
        # companion = compainions_obj_array[index]
        # doc = Nokogiri.open("...fandom.com/wiki/#{companion.name}"
        # input = gets.strip.to_i - 1 
        # Scraper.get_details(input)


        # companion = 
        # Somehow open https://dragonage.fandom.com/wiki/#{index}
        # base_path = "https://dragonage.fandom.com/wiki/"


    end    

end