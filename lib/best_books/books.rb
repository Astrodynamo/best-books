class BestBooks::Books
  attr_accessor :category
  @@all = []
  
  def self.all
    book_1 = self.new
    book_1.category = "Fiction"
    
    book_2 = self.new
    book_2.category = "Mystery & Thriller"
    
    @@all = [book_1, book_2]
  end
  
  
  
end