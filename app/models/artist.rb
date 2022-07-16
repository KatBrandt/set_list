class Artist < ApplicationRecord
  has_many :songs
  validates_uniqueness_of :name

  def average_song_length
    songs.average(:length).to_f
  end

  def self.with_long_songs
    joins(:songs)
    .where('songs.length > 400')
    .distinct
  end

  def self.longest_song_lengths
    test = joins(:songs)
    .select('artists.*, max(length) as longest')
    .group(:id)
    # how to have this in the right format?
  end

  def self.longest_song
    longest_song_lengths
    .order('longest desc')
    .first
    .name
  end
end
