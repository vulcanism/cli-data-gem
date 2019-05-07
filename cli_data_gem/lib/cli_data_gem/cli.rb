class CliDataGem::CLI
  
  def start
    list
    options
  end

  def list
    puts "Available Companions:"
    # Lists companions by iterating through companions.rb
  end
  
  # Asks which character user would like more info on, or if they'd like to exit
  def options
    input = ""
    while input != "exit"
      puts "Which character would you like to know more about?"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on 1..."
      end
    end     
  end

  def goodbye
    puts "Exiting"
  end
  
end