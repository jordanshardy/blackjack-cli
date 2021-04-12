require_relative '../menu'

describe 'main_menu' do
	it 'it should return the user balance' do
		expect(main_menu(500)).to be 500
	end
end

describe 'main_menu' do
	finished = false
	context "when false", if: finished do
		it 'passes' do
				expect(false).to be_falsey
		end
	end
end