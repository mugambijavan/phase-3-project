require 'google/apis/youtube_v3'

class Youtube
  YOUTUBE_API_KEY = "YOUR_API_KEY_HERE"
  
  def self.search(query)
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = YOUTUBE_API_KEY
    
    options = {
      q: query,
      type: "video",
      max_results: 1,
      order: :relevance
    }
    
    response = youtube.list_searches("id,snippet", options)
    
    if response.items.any?
      "https://www.youtube.com/watch?v=#{response.items.first.id.video_id}"
    else
      "No video found."
    end
  end
end
