class CliDataGem::CLI
  
  def start    
    welcome        
    list
    options    
  end

  def welcome
    puts "This is my welcome message!"
    Scraper.scrape_info        
  end  

  # Lists names and locations of game companions
  def list
    puts "Available Companions:"      
  end
  
  # Asks which character user would like more info on, or if they'd like to exit
  def options
    input = ""
    while input != "exit"
      puts "Please type the number of the character you'd like to know more about. You may also type 'list'
      to view the available companions again, or 'exit' to leave the program."      
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on 1..."
      when "list"
        list
      when "exit"
        goodbye
      else
        puts "Not a valid entry, please try again."
      end
    end     
  end
  
  def goodbye
    puts "Exiting program, goodbye!"
  end  
  
end