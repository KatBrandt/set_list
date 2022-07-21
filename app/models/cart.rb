class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents
  end

  def total_count
    binding.pry
    @contents.values.sum
  end
end
