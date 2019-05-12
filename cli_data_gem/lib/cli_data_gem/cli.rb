class CliDataGem::CLI
  
  def start    
    welcome        
    create_list
    # add_details
    show_companions
    options    
  end  

  # Make this pretty and nice
  def welcome
    puts "This is my welcome message!"                        
  end
  
  # Creates Companions objects from scraped info
  def create_list    
    companions_array = Scraper.scrape_info
    CliDataGem::Companions.create_from_collection(companions_array)           
  end
  
  # Adds detailed information from scraped info
  #  def add_details
  #    CliDataGem::Companions.all.each_with_index do |companion, index|
  #      details = Scraper.scrape_details(index)
  #      companion.add_details_to_companions(details)    
  #    end   
  #  end

  def show_companions
    puts "Available companions:"
    CliDataGem::Companions.all.each_with_index do |companion, index|
      puts "#{index + 1}. #{companion.name}"
    end
  end
    
  # Asks which character user would like more info on, or if they'd like to exit
  def options        
            
    input = nil
    while input != "exit"
      puts "Please enter the number of the character you'd like to know more about. You may also type
      'list' to view the available companions again, or 'exit' to leave the program."
      input = gets.strip.downcase
      
      if input.to_i > 0
        puts "Location in game: #{CliDataGem::Companions.all[input.to_i - 1].location}"
        puts "\n"
         details_test = Scraper.scrape_details(input.to_i)
          # CliDataGem::Companions.all.each do |companion|
          # details = Scraper.scrape_details(input.to_i)
          # companion.add_details_to_companions(details)    
          # end  
         ### CliDataGem::Companions.add_details_to_companions(details_test)         
         binding.pry     
             
       
      elsif input == "list"
        show_companions
      elsif input == "exit"
         goodbye
      else
        puts "Not a valid entry, please try again."
        puts "\n"
        options
      end
    end    
  end  
  
  def goodbye
    puts "Exiting program, goodbye!"
  end  
  
end