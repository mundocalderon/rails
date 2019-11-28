# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
book_type = ["Printed Book", "Binder", "Periodical","Compact Disc (CD)", "Videotape (VHS)", "Video Disc (DVD)","Other"]

locations = ['ML-Shelf 1','ML-Shelf 2','ML-Shelf 3','ML-Shelf 4','ML-Shelf 5','ML-Shelf 6','ML-Shelf 7','RFR-Inside','RFR-Outside','Stations-East','Stations-West','Stations-South','CH-Shelf 1','CH-Shelf 2','CH-Shelf 3','CH-Shelf 4','CH-Shelf 5','CH-Shelf 6','CH-Shelf 7','CH-Shelf 8','CH-Shelf 9','CH-Shelf 10','CH-Shelf 11','CH-Shelf 12','CH-Shelf 13','CH-Shelf 14','CH-Shelf 15','CH-Shelf 16','CH-Shelf 17','CH-Shelf 18','CH-Shelf 19','CH-Shelf 20','CH-Shelf 21','CH-Shelf 22', 'CH-Shelf 23']

["Bankroft Whitney", "Edward Hume","Scott E. Sunby", "Michael Millman", "Bill Kurtis", "Tim Junkin", "David R. Dow", "Dan Ducas"].each do |contributor_name|
  Contributor.find_or_create_by_name(:name => contributor_name)
end

["Bankroft Whitney", "Edward Hume","Scott E. Sunby", "Michael Millman", "Bill Kurtis", "Tim Junkin", "David R. Dow", "Dan Ducas"].each do |editor_name|
  Editor.find_or_create_by_name(:name => editor_name)
end

Book.create :title => "Deering's Annotated Evidence Code ",
            :publication_type => book_type.sample(1),
            :date_of_publication => "1990-2-1",
            :published_by => "Deering",
            :edition => "1",
            :number_of_copies => "1",
            :volume => "",
            :location => locations.sample(1),
            :contributors => Contributor.all.sample(1),
            :editors => Editor.all.sample(1)
            
Book.create :title => "Annotated California Codes",
            :publication_type => book_type.sample(1),
            :date_of_publication => "1990-2-1",
            :published_by => "Lexis",
            :edition => "",
            :number_of_copies => "1",
            :volume => "",
            :location => locations.sample(1),
            :contributors => Contributor.all.sample(2),
            :editors => Editor.all.sample(1)
            
Book.create :title => "	Ninth Circuit Capital Punishment Handbook ",
             :publication_type => book_type.sample(1),
             :date_of_publication => "1990-2-1",
             :published_by => "West",
             :edition => "",
             :number_of_copies => "1",
             :volume => "",
             :location => locations.sample(1),
             :contributors => Contributor.all.sample(1),
             :editors => Editor.all.sample(2)

Book.create :title => "Death Penalty Cases in California Criminal Law Procedure and Practice",
            :publication_type => book_type.sample(1),
            :date_of_publication => "1990-2-1",
            :published_by => "West",
            :edition => "Fourth",
            :number_of_copies => "1",
            :volume => "",
            :location => locations.sample(1),
            :contributors => Contributor.all.sample(2),
            :editors => Editor.all.sample(2)












            