require 'rails_helper'

describe 'When a user adds songs to their cart' do
  it 'displays a message' do
    artist = Artist.create(name: 'Rick Astley')
    song = artist.songs.create(title: 'Never Gonna Give You Up', length: 250, play_count: 100000)

    visit songs_path

    within("#song-#{song.id}") do
      click_on "Add Song"
    end

    expect(page).to have_content("You now have 1 copy of #{song.title} in your cart.")
  end

  it 'increments for multiple songs and updates message' do
    artist = Artist.create(name: 'Rick Astley')
    song1 = artist.songs.create(title: 'Never Gonna Give You Up', length: 250, play_count: 100000)
    song2 = artist.songs.create(title: "Don't Stop Believin'", length: 300, play_count: 1)

    visit songs_path

    within("#song-#{song1.id}") do
      click_on "Add Song"
    end

    within("#song-#{song2.id}") do
      click_on "Add Song"
    end

    within("#song-#{song1.id}") do
      click_on "Add Song"
    end

    expect(page).to have_content "You now have 2 copies of #{song1.title} in your cart."
  end
end
