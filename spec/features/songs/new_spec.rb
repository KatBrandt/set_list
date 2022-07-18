require 'rails_helper'

describe 'creating a new song' do
  it 'can create a song' do
    artist = Artist.create!(name: 'Journey')
    title = "Don't Stop Believin'"
    length = 231
    play_count = 7849

    visit "/artists/#{artist.id}/songs/new"

    expect(page).to have_content(artist.name)

    fill_in "title", with: title
    fill_in "length", with: length
    fill_in "play_count", with: play_count

    click_on "Create Song"

    new_song = Song.last

    expect(current_path).to eq song_path(new_song.id)
    expect(current_path).to eq "/songs/#{new_song.id}"
    expect(page).to have_content(title)
    expect(page).to have_content(length)
    expect(page).to have_content(play_count)
    expect(page).to have_content(artist.name)
  end
end
