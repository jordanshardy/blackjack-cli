require_relative '../value'

describe 'hand_value' do
	it 'it should return a random card from the deck' do
		expect(hand_value([3,3])).to be 6
	end
end