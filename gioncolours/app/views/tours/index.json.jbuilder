json.array!(@tours) do |tour|
  json.extract! tour, :id, :title, :description, :date_begin, :date_end
  json.url tour_url(tour, format: :json)
end
