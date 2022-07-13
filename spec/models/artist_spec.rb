require 'rails_helper'

RSpec.describe Artist do
  describe 'relationships' do
    it {should have_many :songs}
  end

  describe 'instance methods' do
    describe '#average_song_length' do
      before :each do
        @prince = Artist.create!(name: 'Prince')
        @purple = @prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
        @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 664, play_count: 99)
        @other_song = @prince.songs.create!(title: 'Another Prince Song', length: 1, play_count: 99)
      end

      it 'returns the average song length' do
        expect(@prince.average_song_length.round(2)).to eq(503.33)
      end
    end
  end

  describe 'class methods' do
    describe '.with_long_songs' do
      it 'returns artists who have songs longer than 400' do
        @prince = Artist.create!(name: 'Prince')
        @rtj = Artist.create!(name: 'Run The Jewels')
        @caamp = Artist.create!(name: 'Caamp')
        @jgb = Artist.create!(name: 'Jerry Garcia Band')
        @billie = Artist.create!(name: 'Billie Eilish')
        @lcd = Artist.create!(name: 'LCD Soundsystem')

        @prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
        @prince.songs.create!(title: 'Raspberry Beret', length: 665, play_count: 99)

        @rtj.songs.create!(title: 'Legend Has It', length: 2301, play_count: 2300000)
        @rtj.songs.create!(title: 'Talk to Me', length: 2301, play_count: 2300000)

        @caamp.songs.create!(title: '26', length: 940, play_count: 150000)
        @caamp.songs.create!(title: 'Vagabond', length: 240, play_count: 120000)

        @billie.songs.create!(title: 'bury a friend', length: 340, play_count: 1200000)
        @billie.songs.create!(title: 'bad guy', length: 240, play_count: 100000)

        @lcd.songs.create!(title: 'Someone Great', length: 500, play_count: 1000000)
        @lcd.songs.create!(title: 'I Can Change', length: 640, play_count: 100000)

        expect(Artist.with_long_songs).to match_array [@prince, @rtj, @caamp, @lcd]
        expect(Artist.with_long_songs).to contain_exactly @prince, @rtj, @caamp, @lcd
        # with an array when we don't care about the order of the returned array, can use match_array or contain_exactly instead of eq
      end
    end
  end
end
