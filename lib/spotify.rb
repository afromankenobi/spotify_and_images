# Little class to make calls to spotify web api (https://developer.spotify.com/web-api/)
# This just provide one method, search by track on spotify and list 20 results
class Spotify
  include HTTParty
  base_uri 'https://api.spotify.com/v1'

  # Method that search 20 tracks that match with query search
  # returns nil if search is blank or nil
  # return a hash with artist, album, track (name) and popularity
  def search_tracks(search)
    return false if search.blank?
    result = self.class.get("/search?q=track:#{search}&type=track&limit=20")
    result = result["tracks"]["items"].map do |t| {
      artist: t["artists"].first["name"],
      album: t['album']['name'],
      track: t['name'],
      popularity: t['popularity']
      }
    end

    result = JSON.parse result.to_json
  end
end