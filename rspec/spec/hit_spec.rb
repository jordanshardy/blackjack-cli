# hit method rspec test
require_relative '../hit'


describe 'hit' do
	it 'it should return an array with a single integer value' do
        expect(hit([])).to match_array([1])
	end
end


