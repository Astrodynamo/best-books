class BestBooks::Books
  attr_accessor :category, :url, :votes, :title, :author, :blurb
  @@all = []
  
  def self.all
    @@all
  end
  
  ### move scrapers to a scraper class, define find or make books method to handle double scrapes
  
  def self.make_books (year)
    doc = Nokogiri::HTML(open("https://www.goodreads.com/choiceawards/best-books-#{year}"))
    doc.css("div.category.clearFix").each do |object|
      book = self.new
      book.url = object.css("a").attribute("href").value
      book.category = object.css("h4.category__copy").text.strip
      @@all << book
    end
    
  end
  
  def add_deets
    doc = Nokogiri::HTML(open("https://www.goodreads.com#{@url}"))
    self.votes = doc.css("span.greyText.gcaNumVotes").text.strip.gsub("\n", " ")
    self.title = doc.css("a.winningTitle").text.strip
    self.author = doc.css("a.authorName span").text.strip
    self.blurb = doc.search("#description").text.strip.gsub("â\u0080\u0099", "'")
  end
  
end