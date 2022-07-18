class Artist < ApplicationRecord
  has_many :songs
  validates_uniqueness_of :name

  def self.with_long_songs
    joins(:songs)
    .where('songs.length > 400')
    .distinct
  end

  def self.longest_song_lengths
    test = joins(:songs)
    .select('artists.*, max(length) as longest')
    .group(:id)
    # how to have this in the right format?
    #rework into an instance method
  end

  def self.longest_song
    longest_song_lengths
    .order('longest desc')
    .first
    .name
    # if from scratch could do it like below:
    # joins(:songs)
    # .select('artists.name, max(length) as longest')
    # .group(:name)
    # .order('longest desc')
    # .limit(1)[0]
    # .name
  end

  def self.avg_length_of_songs
    joins(:songs)
    .select('artists.*, avg(length) as avg')
    .group(:id)
  end

  def self.name_longest_avg
    avg_length_of_songs
    .order('avg desc')
    .first
    .name
  end

  def self.least_plays
    result = joins(:songs)
    .select('artists.name, sum(songs.play_count) as total_plays')
    .group(:name)
    .order('total_plays asc')
    .limit(3)

    pull_names(result)
  end

  def self.pull_names(artist_list)
    artist_list.pluck(:name)
  end

  def self.complete_song_list
    joins(:songs)
    .select('artists.name, songs.title')
    .group(:name)

  end

  def average_song_length
    songs.average(:length).to_f
  end

  def longest_song_length
    Artist.longest_song_lengths
    .where(id: self.id)
    .first
    .longest
  end
end
