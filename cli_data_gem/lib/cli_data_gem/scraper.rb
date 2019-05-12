require 'open-uri'
require 'nokogiri'
require 'pry'

# Scrapes name and detail data from given url
class Scraper

    PAGE_URL = "https://dragonage.fandom.com/wiki/Companions_and_advisors_(Inquisition)"
    
    # Gets character info
    def self.scrape_info
        doc = Nokogiri::HTML(open(PAGE_URL))
        
        companions_hash = {}
        companions = []             
           
        doc.css("table.sortable").each do |companion|           
            companion.css("tr").each_with_index do |row, index|                      
                if index > 0
                    details_page = Nokogiri::HTML(open("https://dragonage.fandom.com/wiki/#{row.css("a").first.text.tr(" ", "_")}"))
              
                    companions_hash = {
                    :name => row.css("a").first.text,
                    :location => row.css("td")[1].text.gsub("\n",""),
                    :quote => details_page.css("div.quote").first.text.gsub("\n",""),
                    :race => details_page.css("div.pi-data-value")[0].text.tr("[0-9]", ""),
                    :gender => details_page.css("div.pi-data-value")[1].text,
                    :role => details_page.css("div.pi-data-value")[2].text,
                    }
                    companions << companions_hash                                     
                end             
            end
        end    
       companions   
    end   
end