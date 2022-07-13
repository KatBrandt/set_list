class Artist < ApplicationRecord
  has_many :songs

  def average_song_length
    self.songs.average(:length)
  end

  def self.with_long_songs
    joins(:songs)
    .where('songs.length > 400')
    .distinct
  end
end
