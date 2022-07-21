require 'rails_helper'

describe 'Cart Index' do
  describe 'when I click on the Cart link' do
    it 'shows the contents of my cart' do
      artist1 = Artist.create(name: 'Rick Astley')
      artist2 = Artist.create(name: 'Nirvana')
      song1 = artist1.songs.create(title: 'Never Gonna Give You Up', length: 250, play_count: 100000)
      song2 = artist1.songs.create(title: "Don't Stop Believin'", length: 300, play_count: 1)
      song3 = artist2.songs.create(title: "Smells Like Teen Spirit", length: 275, play_count: 7635628)

      cart = Cart.new({"1" => 2, "2" => 3, "3" => 1})

      visit songs_path

      click_link "Cart"

      expect(path).to eq "/cart"

      within("#song-#{song1.id}") do
        expect(page).to have_content "#{song1.title}: #{cart[song1.id.to_s]}"
      end

      within("#song-#{song2.id}") do
        expect(page).to have_content "#{song2.title}: #{cart[song2.id.to_s]}"
      end

      within("#song-#{song3.id}") do
        expect(page).to have_content "#{song3.title}: #{cart[song3.id.to_s]}"
      end
    end
  end
end
