json.array!(@announcements) do |announcement|
  json.extract! announcement, :id, :title, :content, :post_date, :attachment
  json.url announcement_url(announcement, format: :json)
end
