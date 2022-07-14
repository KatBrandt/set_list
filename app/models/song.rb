class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  validates :title, length: { maximum: 500 }
  validates_numericality_of :play_count, only_integer: true
end
