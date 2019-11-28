class EntryType < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :entries
end
