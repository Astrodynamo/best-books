class BestBooks::CLI
  attr_accessor :year
  
  def initialize
    @year = Time.now.year - 1
  end
  
  def call
    #executable method
    list_categories
    menu
    puts "Goodbye."
  end
  
  def list_categories
    #get from scraper on main page
    puts "Goodreads Choice Awards Categories for #{@year.to_s}"
    
    @books = BestBooks::Books.all
    @books.each.with_index(1) do |book, i| 
      puts "#{i}. #{book.category}"
    end
  end
  
  def menu
    selection = nil
    while selection != "exit"
      puts "Choose a category number to see the latest winner, type 'list' to see the list again, or type 'exit'."
      selection = gets.strip.downcase
      
      if selection.to_i > 0
        puts @books[selection.to_i - 1] ##flesh out to show book info once scraper is working
      elsif selection == "list"
        list_categories
      elsif selection == "exit"
        #puts "goodbye" ##consider where to put goodbye (currently in #call)
      else
        puts "I'm not sure what you mean. Please type 'list' or 'exit'."
      end
    end
  end
  
end