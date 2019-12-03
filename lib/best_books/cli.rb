class BestBooks::CLI
  attr_accessor :year
  
  def initialize
    @year = Time.now.year - 1 #awards for current year happen at the end of the year.
    BestBooks::Books.make_books(@year)
  end
  
  def call
    list_categories
    menu
  end
  
  def list_categories
    puts "Goodreads Choice Awards Categories for #{@year.to_s}:"
    
    @books = BestBooks::Books.all
    @books.each.with_index(1) do |book, i| 
      puts "#{i}. #{book.category}"
    end
  end #alice@flatironschool.com
  
  def menu
    selection = nil
    max = @books.size
    
    while selection != "exit"
      puts "Choose a category number to see the latest winner, type 'list' to see the list again, or type 'exit'."
      selection = gets.strip.downcase
      selection_number = selection.to_i
      
      if selection_number > 0 && selection_number <= max
        book = @books[selection_number - 1]
        book.add_deets_if_needed
        puts "\nBest #{book.category} #{@year}:" ### This is weird for #5 'best of the best' category - add a nested if statement to account for category starting with "Best"
        puts "#{book.title}"
        puts "by #{book.author}"
        puts "#{book.votes}"
        puts "\n#{book.blurb}\n "

      elsif selection == "list"
        list_categories
      elsif selection == "exit"
        puts "Thanks for reading. Goodbye."
      else
        puts "I'm not sure what you mean. Please type a category number, 'list', or 'exit'."
      end
    end
  end
  
end