class Address < ActiveRecord::Base
  attr_accessible :active_date_from, :active_date_to, :addr_status, :city, :county, :line_1, :line_2, :person_id, :state, :zip_code
  belongs_to :person
  
end
