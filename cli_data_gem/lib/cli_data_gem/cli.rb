class CliDataGem::CLI
  
  def start    
    welcome        
    create_list
    show_companions
    options    
  end  

  # Lists names and locations of game companions
  def welcome
    puts "This is my welcome message!"                    
  end
  
  def create_list    
    companions_array = Scraper.scrape_info
    CliDataGem::Companions.create_from_collection(companions_array)           
  end  

  def show_companions
    puts "Available companions:"
    CliDataGem::Companions.all.each_with_index do |companion, index|
      puts "#{index + 1}. #{companion.name}"
    end
  end
    
  # Asks which character user would like more info on, or if they'd like to exit
  def options        
            
    input = ""
    while input != "exit"
      puts "Please enter the number of the character you'd like to know more about. You may also type
      'list' to view the available companions again, or 'exit' to leave the program."
      input = gets.strip.downcase
      
      if input.to_i > 0
        puts "Location in game: #{CliDataGem::Companions.all[input.to_i - 1].location}"     
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