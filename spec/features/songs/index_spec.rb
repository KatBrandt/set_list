require 'rails_helper'

describe 'songs index page', type: :feature do
  it 'can see all song titles and play count' do
    bob = Artist.create!(name: "Bobby Bob")
    carly = Artist.create!(name: "Carly Rae Jepson")

    song1 = Song.create!(title: "I Really Like You", length: 208, play_count: 735897235, artist: bob)
    song2 = Song.create!(title: "Call Me Maybe", length: 199, play_count: 5, artist: carly)

    visit "/songs"

    expect(page).to have_content(song1.title)
    expect(page).to have_content("Play Count: #{song1.play_count}")
    expect(page).to have_content(song2.title)
    expect(page).to have_content("Play Count: #{song2.play_count}")
  end
end
