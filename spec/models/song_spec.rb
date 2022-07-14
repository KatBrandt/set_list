require 'rails_helper'

RSpec.describe Song, type: :model do
  describe 'relationships' do
    it {should belong_to :artist}
  end

  describe 'validations' do
    it { should validate_length_of(:title).is_at_most(500) }
  end
end
