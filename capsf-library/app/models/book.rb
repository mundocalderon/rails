class Book < ActiveRecord::Base
  attr_accessible :title, :publication_type, :date_of_publication, :published_by, :edition, :number_of_copies,
                  :volume, :location,:contributor_ids, :citation, :editor_ids, :contributors, :editors
  validates_presence_of :title, :publication_type, :number_of_copies, :location
  has_and_belongs_to_many :contributors
  has_and_belongs_to_many :editors
  has_many :transactions
  
  #scope :issued, joins(:transactions).where('transactions.date_of_issue is not null and transactions.date_of_return is null' )
  
  #scope :by_user, lambda{ |user| joins(:transactions).where('transactions.user_id = ?', user) }

  
  UNRANSACKABLE_ATTRIBUTES = ["id", "number_of_copies", "created_at", "updated_at"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
  
  def copies_available
    checked_out = Transaction.where(:book_id => id, :date_of_return => nil ).count
    total = number_of_copies - checked_out
  end
  
end
