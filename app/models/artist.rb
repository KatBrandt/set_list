class Artist < ApplicationRecord
  has_many :songs
  validates_uniqueness_of :name

  def average_song_length
    self.songs.average(:length)
  end

  def self.with_long_songs
    joins(:songs)
    .where('songs.length > 400')
    .distinct
  end
end
