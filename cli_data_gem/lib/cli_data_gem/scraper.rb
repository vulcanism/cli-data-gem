require 'open-uri'
require 'nokogiri'
require 'pry'

# Scrapes name and detail data from given url
class Scraper

    PAGE_URL = "https://dragonage.fandom.com/wiki/Companions_and_advisors_(Inquisition)"
    BASE_URL = "https://dragonage.fandom.com/wiki/"

    # Gets character name and location
    def self.scrape_info
        doc = Nokogiri::HTML(open(PAGE_URL))
        
        companions_hash = {}
        companions = []             
           
        doc.css("table.sortable").each do |companion|           
            companion.css("tr").each_with_index do |row, index|                      
             if index > 0
              companions_hash = {
              :name => row.css("a").first.text,
              :location => row.css("td")[1].text.gsub("\n",""),
              # :details => open(BASE_URL + "#{companions_hash[:name]}")
              # row.open("https://dragonage.fandom.com/wiki/#{row.name}")
              # open("https://dragonage.fandom.com/wiki/#{companions_hash[:name]}")
              }
              companions << companions_hash                                     
             end
                             
            end
        end    
       companions     
    end

    # Gets character details
    def self.scrape_details(index)
        details_hash = {}
        character = CliDataGem::Companions.all[index - 1]
        doc = Nokogiri::HTML(open("https://dragonage.fandom.com/wiki/#{character.name}"))
        details_hash = {
            :quote => doc.css("div.quote").text.gsub("\n",""),
            :race => doc.css("div.pi-data-value")[0].text,
            :gender => doc.css("div.pi-data-value")[1].text,
            :role => doc.css("div.pi-data-value")[2].text,
        }
        # quote = doc.css("div.quote").text
        # race = doc.css("div.pi-data-value")[0].text
        # gender = doc.css("div.pi-data-value")[1].text
        # role = doc.css("div.pi-data-value")[2].text
        
        # def self.scrape_details(index)
        # index should be -1 beforre we get here user says 1 we want 0 
        # companion = compainions_obj_array[index]
        # doc = Nokogiri.open("...fandom.com/wiki/#{companion.name}"
        # input = gets.strip.to_i - 1 
        # Scraper.get_details(input)               
        

    end
        

end