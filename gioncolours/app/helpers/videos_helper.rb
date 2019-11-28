module VideosHelper
  def youtube_id(youtube_url)
    youtube_id = youtube_url.split("=").last
    return youtube_id
    #content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end
 
end
