json.array!(@videos) do |video|
  json.extract! video, :id, :title, :description, :video_type_id, :video_url
  json.url video_url(video, format: :json)
end
