json.array!(@gigs) do |gig|
  json.extract! gig, :id, :date, :venue, :location, :details, :link
  json.url gig_url(gig, format: :json)
end
