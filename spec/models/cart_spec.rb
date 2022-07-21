require 'rails_helper'

describe Cart do
  subject { Cart.new({"1" => 2, "2" => 3})}

  describe 'instance methods' do
    describe '#total_count' do
      it 'can calculate the total number of items it holds' do
        expect(subject.total_count).to eq 5
      end
    end

    describe '#add_song' do
      it 'adds a song to its contents' do
        subject.add_song(1)
        subject.add_song(2)

        expect(subject.contents).to eq({"1" => 3, "2" => 4})
      end

      it 'adds a song that hasnt been added yet' do
        subject.add_song(3)
        expect(subject.contents). to eq({
          "1" => 2,
          "2" => 3,
          "3" => 1
          })
      end
    end

    describe '#count_of' do
      it 'returns count of songs in cart for specific song' do
        cart = Cart.new({})
        expect(cart.count_of(5)).to eq 0
      end
    end
  end
end
