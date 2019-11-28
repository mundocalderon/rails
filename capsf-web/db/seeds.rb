require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
PublicActivity.enabled = false 
=begin
thefile = "#{Rails.root}/lib/assets/links.csv"
puts "opening #{thefile}"
CSV.foreach(thefile, headers:true) do |row|
  puts "read: #{row.to_hash}"
  e = Entry.create! row.to_hash
  #e.doc = File.open("/Users/rcalderon/Desktop/Migrated\ Documents/#{e.description}")
  #e.category_ids = 19,21
  #e.subcategory_ids = 37,49
  #e.document_date = Date.parse(e.description)
  #e.published = "1"
  #e.highlight = "1"
  e.save!
  
end

    Category.delete_all

    ["Appellate Practice and Legal Research_this will deal with direct appeal through cert and USSC.",
      "Brief Bank and Sample Pleadings_merging briefs and sample pleadings.",
      "Habeas Practice and Claims_this will allow us to fold federal work in here as well",
      "California Supreme Court Practice and Policies_ this will go to both appeal and habeas, OSCs, HEarings, etc.",
      "Topics and Keywords_the specialties areas.",
      "",
      "Publications_ Cap's publications.",
      "Library_Cap's library materials.",
      "San Quentin and Prison Resources_prison resources",
      "Training and Standard of Care Resources_mary's areas.",
      "Client Profiles_an area dedicated to our document management",
      "Expert Database_tool for finding an expert."].each do |t|
      name, description = t.chomp.split("_")
      Category.find_or_create_by_name(name, :description => description)
    end

    ["AEDPA-General_this is aedpa subcategory_1", "Gang Evidence_this is gang evidence subcategory_1", "General Claims_ this is general claims subcat_2", "Investigation_this is investigation subcat_3"].each do |t|
      name, description, category = t.chomp.split("_")
      Subcategory.find_or_create_by_name(name, :description => description, :category_id => category)
    end

    Entry.delete_all

    ["CAP Publications_Publications by CAP. ie. CAP Manual, PRB, etc. CAP written with links to internal pages", 
      "Outside Articles_Articles taken from other places that don't necessarily carry links we can break. IFP, Atkins, etc.", 
      "Seminars_Packets of Materials from outside that definitely link to other docs on CAP servers", 
      "Training Materials_Packets of Materials that could possibly link to other docs on CAP serves"].each do |t|
      name, description = t.chomp.split("_")
      EntryType.find_or_create_by_name(:name => name, :description => description)
    end 

    =begin
      Entry.create  :title => "A Brief History of CAP", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [1]),
                    :document_date => '2012-12-01'

      Entry.create  :title => "CAP Charter", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [1]),
                    :document_date => '2012-12-01'

      Entry.create  :title => "Death Penalty Resources", 
                    :entry_type_id => 1, 
                    :description => "This is a training document.",
                    :published => true,
                    :categories => Category.where(:id => [1]),
                    :document_date => '2012-12-01'

      Entry.create  :title => "About CAP", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [1]),
                    :document_date => '2012-12-01'

      Entry.create  :title => "Case Assistance Guides", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [5,6]),
                    :document_date => '2012-12-01'

      Entry.create  :title => "The CAP Manual", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [5,6,9]),
                    :document_date => '2012-12-01'

      Entry.create  :title => "Primer", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [6]),
                    :document_date => '2012-12-01'

      Entry.create  :title => "DPI", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [6]),
                    :document_date => '2012-12-01'

      Entry.create  :title => "RECAP", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [6,9]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Citelist", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [6]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Review Granted", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [6]),
                    :document_date => '2012-12-01'

      Entry.create  :title => "CA Slip Opinions", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [6]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "U.S. Supreme Court", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [6]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "CAP Capital Appellate Seminars", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [6]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Other Appellate Seminars", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [6]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Samples and Templates", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [6]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Stays", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [8]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Competency", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [8]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Clemency", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [8]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "CAP Habeas Assistance and Habeas Team", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [5]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "HCRC Practice Guides", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [5]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "General Materials - Guilt", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [5]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "General Materials - Penalty & Mitigation", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [5]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Orders and Opinions", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [5]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Experts", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [5]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Listserv", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [5]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "TipJar", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [5]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Federal Law affecting State Habeas Practice", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [5]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Death Penalty Policy", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [11]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Court Links", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [11]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Evaluation and Appointment", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [11]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Attorney Compensation", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [11]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Funding & Non-attorney Expenses", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [11]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Trial Files", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [11]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Timeliness", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [11]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "Motions to Withdraw", 
                    :entry_type_id => 1, 
                    :description => "",
                    :published => true,
                    :categories => Category.where(:id => [11]),
                    :document_date => '2012-12-01'


      Entry.create  :title => "First Petitions", 
                  :entry_type_id => 1, 
                  :description => "",
                  :published => true,
                  :categories => Category.where(:id => [11]),
    	      :document_date => '2012-12-01'
=end
