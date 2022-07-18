require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'displays the song title, length and play' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456357)

    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to have_content(song.length)
    expect(page).to have_content(song.play_count)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays the name of artist for the song' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456357)

    visit "/songs/#{song.id}"

    expect(page).to have_content(artist.name)
  end

  it 'has link back to songs index' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456357)

    visit "/songs/#{song.id}"

    expect(page).to have_link("Back to All Songs")

    click_on "Back to All Songs"

    expect(current_path).to eq '/songs'
    expect(page).to have_content(song.title)
    expect(page).to have_content(song_2.title)
  end
end
