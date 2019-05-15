class CliDataGem::CLI
  
  def start    
    welcome        
    create_list    
    show_companions
    options    
  end  

  # Welcomes user
  def welcome
    puts "Welcome to the Dragon Age: Inquisition companions Ruby gem!"                        
  end
  
  # Creates Companions objects from scraped info
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

    input = nil
    while input != "exit"
      puts "Please enter the number of the character you'd like to know more about. Enter 'random' to
      be given a random companion's information. You may also type 'list' to view the
      available companions again, or 'exit' to leave the program."
      input = gets.strip.downcase
      companion = CliDataGem::Companions.all[input.to_i - 1]
      if input.to_i > 0
        puts "Location: #{companion.location}"
        puts "\n"
        puts "Quote: #{companion.quote}"
        puts "\n"
        puts "Race: #{companion.race}"
        puts "\n"
        puts "Gender: #{companion.gender}"
        puts "\n"
        puts "Role: #{companion.role}"
        puts "\n"
      elsif input == "random"
        companion = CliDataGem::Companions.all[(rand(0..9))]
        puts "Name: #{companion.name}"
        puts "\n"
        puts "Location: #{companion.location}"
        puts "\n"
        puts "Quote: #{companion.quote}"
        puts "\n"
        puts "Race: #{companion.race}"
        puts "\n"
        puts "Gender: #{companion.gender}"
        puts "\n"
        puts "Role: #{companion.role}"
        puts "\n"
      elsif input == "list"
        show_companions
      elsif input == "exit"
         goodbye
      else
        puts "Not a valid entry, please input a number, 'list,' or 'exit.'"
        puts "\n"
        options
      end
    end    
  end  
  
  def goodbye
    puts "Exiting program, goodbye!"
  end  
  
end