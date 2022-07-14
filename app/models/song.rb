class Song < ApplicationRecord
  belongs_to :artist

  validates :title, length: { maximum: 500 }
end
