# Class that uses lib/spotify.rb to get tracks and process the result
# Also, provide methods to select songs and save into db.
class SearchController < ApplicationController
  require 'Spotify'

  def index
  end

  def results
    search = params[:search]
    spotify = Spotify.new
    @results = spotify.search_tracks(search)
  end

  def add_songs
    # Create a container to save only selected songs
    params['filtered_songs'] = []
    #Iterate over all songs
    params['songs'].each do |song|
      # add song if selected
      params['filtered_songs'] << song if song['save']
    end
    #Create songs selected
    Song.create song_params
    #Go to songs_index
    redirect_to songs_path
  end

  private

  #Tell to strong_params that filtered_songs is an array and each object in must be validated
  def song_params
    params.require('filtered_songs').map{|p| p.permit([:artist, :name, :popularity])}
  end
end
