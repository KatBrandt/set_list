require 'rails_helper'

RSpec.describe Song, type: :model do
  describe 'relationships' do
    it {should belong_to :artist}
    it {should have_many :playlist_songs}
    it {should have_many(:playlists).through(:playlist_songs)}
  end

  describe 'validations' do
    it { should validate_length_of(:title).is_at_most(500) }
    it { should validate_numericality_of(:play_count).only_integer }
    it { should validate_numericality_of(:play_count).on(:update) }
  end
end
