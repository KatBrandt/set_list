class Song < ApplicationRecord
  belongs_to :artist

  validates :title, length: { maximum: 500 }
  validates_numericality_of :play_count, only_integer: true
end
