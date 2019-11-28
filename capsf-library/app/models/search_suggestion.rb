class SearchSuggestion < ActiveRecord::Base
  attr_accessible :popularity, :term
  
  def self.terms_for(prefix)
    suggestions = where("term like ?", "#{prefix}_%")
    suggestions.order("popularity desc").limit(10).pluck(:term)
  end
  #this function is called from a rake task called search_suggestions:index. to create the index run:
  # rake search_suggestions:index
  def self.index_books
    Book.find_each do |book|
      index_term(book.title)
      book.title.split.each { |t| index_term(t) }
      book.contributors.map{|c| index_term(c.name)}
      book.editors.map{|e| index_term(e.name)}
    end
  end
  
  def self.index_term(term)
    where(term: term.downcase).first_or_initialize.tap do |suggestion|
      suggestion.increment! :popularity
    end
  end
  
end
