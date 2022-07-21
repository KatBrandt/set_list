class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def total_count
    @contents.values.sum
  end

  def add_song(id)
    @contents[id.to_s] = count_of(id) + 1
  end

  def count_of(song_id)
    @contents[song_id.to_s].to_i
  end
end
