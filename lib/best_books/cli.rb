class BestBooks::CLI
  attr_accessor :year
  
  def call
    #executable method
    @year = Time.now.year - 1
    list_categories
    menu
  end
  
  def list_categories
    #get from scraper on main page
    puts "Goodreads Choice Awards Categories for #{@year.to_s}"
    puts "1. Fiction"
    puts "2. Mystery & Thriller"
    #@categories = BestBooks::Books.categories
  end
  
  def menu
    selection = nil
    while selection != "exit"
      puts "Choose a category number to see the latest winner or type 'exit'"
      selection = gets.strip
      
      #loop thru categories
      
    end
    
  end
  
end