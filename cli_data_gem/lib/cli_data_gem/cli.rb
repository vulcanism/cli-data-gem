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
      puts "Which character would you like to know more about? Or type 'list' to see the list again"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on 1..."
      when "list"
        list
      else
        puts "Not a valid entry, please try again"
      end
    end     
  end  
  
end