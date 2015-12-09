require 'rspec'

class Change

  def change(cents)
    denominations = [25, 10, 5, 1]
    total_change = []
    denominations.each do |coin|
      until cents < coin
        total_change << coin
        cents -= coin
      end
    end
    return total_change
  end
end

RSpec.describe Change do
  describe '#change' do
    it 'should return 1 if given 1' do
      change = Change.new
      expect(change.change(1)).to eq([1])
    end

    it 'should return [1,1] if given 2' do
      change = Change.new
      expect(change.change(2)).to eq([1, 1])
    end

    it 'should return 5 if given 5' do
      change = Change.new
      expect(change.change(5)).to eq([5])
    end

    it 'should return 6 if given 6' do 
      change = Change.new
      expect(change.change(6)).to eq([5, 1])
    end

    it 'should return [25, 25, 10] if given 60' do
      change = Change.new
      expect(change.change(60)).to eq([25, 25, 10])
    end

    it 'should return [25, 25, 25, 25, 10, 5] if given 115' do
      change = Change.new
      expect(change.change(115)).to eq([25, 25, 25, 25, 10, 5])
    end

    it 'should return [25, 25, 25, 25, 10, 5, 1, 1] if given 117' do
      change = Change.new
      expect(change.change(117)).to eq([25, 25, 25, 25, 10, 5, 1, 1])
    end

  end
end