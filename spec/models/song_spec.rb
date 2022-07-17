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

  describe 'Instance methods' do

  end

  describe 'Class methods' do
    describe '.longest_length' do
      it 'returns the length of the longest song' do
        @prince = Artist.create!(name: 'Prince')
        @rtj = Artist.create!(name: 'Run The Jewels')
        @caamp = Artist.create!(name: 'Caamp')
        @jgb = Artist.create!(name: 'Jerry Garcia Band')
        @billie = Artist.create!(name: 'Billie Eilish')
        @lcd = Artist.create!(name: 'LCD Soundsystem')

        @prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
        @prince.songs.create!(title: 'Raspberry Beret', length: 665, play_count: 99)

        @rtj.songs.create!(title: 'Legend Has It', length: 2305, play_count: 2300000)
        @rtj.songs.create!(title: 'Talk to Me', length: 2301, play_count: 2300000)

        @caamp.songs.create!(title: '26', length: 940, play_count: 150000)
        @caamp.songs.create!(title: 'Vagabond', length: 240, play_count: 120000)

        @billie.songs.create!(title: 'bury a friend', length: 340, play_count: 1200000)
        @billie.songs.create!(title: 'bad guy', length: 240, play_count: 100000)

        @lcd.songs.create!(title: 'Someone Great', length: 500, play_count: 1000000)
        @lcd.songs.create!(title: 'I Can Change', length: 640, play_count: 100000)

        expect(Song.longest_length). to eq 2305
      end
    end
  end
end
