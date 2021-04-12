#bet method rspec test
require_relative '../bet'

describe 'bet' do
	user_input = true
	context "when true", if: user_input do
		it 'passes' do
				expect(true).to be_truthy
		end
	end
end

user_input = false
context "when false", if: user_input do 
	it 'passes' do
		expect(false).to be_falsey
	end
end

describe 'bet' do
	it 'it should return wager equal to user balance' do
		expect(bet(50)).to be 50
	end
end
