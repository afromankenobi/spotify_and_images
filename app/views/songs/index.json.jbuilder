json.array!(@songs) do |song|
  json.extract! song, :id, :name, :album, :popularity
  json.url song_url(song, format: :json)
end
