class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
    change_column :gigs, :date, :date
    change_column :announcements, :post_date, :date
    
  end
end
