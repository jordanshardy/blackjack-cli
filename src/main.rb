require 'json'
require 'tty-prompt'
require 'tty-font'
require 'pastel'
font = TTY::Font.new(:doom)
pastel = Pastel.new



class Play 
  attr_reader :player_hand, :dealer_hand

  def initialize
    @deck = JSON.parse(File.read('deck.json'), :symbolize_names => true)
    @rules = JSON.parse(File.read('rules.json'), :symbolize_names => true)
    @user = JSON.parse(File.read('user.json'), :symbolize_names => true)
    @prompt = TTY::Prompt.new 
    @font = TTY::Font.new(:doom)
    @player_hand = []
    @dealer_hand = []
    @wager = 0
  end

  def main_menu
    finished = false
    while finished == false
      user_input = @prompt.select("\nWelcome, Please choose from the following options") do |menu|
        menu.choice 'View Rules'
        menu.choice 'View Balance'
        menu.choice 'View Ratio'
        menu.choice 'Play Game'
        menu.choice 'Quit'
      end

    if user_input == 'View Rules'
      @rules.each do |rule|
        puts rule
      end 
    elsif user_input == 'View Balance'
      puts "\nYour bank balance is $#{@user[:balance]}"
    elsif user_input == 'View Ratio'
      puts "\nYour win/loss ratio is #{@user[:ratio]}"
    elsif user_input == 'Play Game'
      run_game() 
      clear_hands()
    else user_input == 'Quit'
      finished = true
      update_file()
    end
    end
  end

  def update_file
    file = File.read('./user.json')
    data_hash = JSON.parse(file)
    data_hash['balance'] = @user[:balance]
    File.write('./user.json', JSON.dump(data_hash))
  end

  def random_card
    return @deck[rand(@deck.length)]
  end

  def starting_hands
    @dealer_hand.push(random_card)
    @player_hand.push(random_card, random_card)
  end

  def hand_value(hand)
      sum = 0
      hand.each do |card|
        sum += card
      end
      sum
  end

  def clear_hands
    @player_hand = []
    @dealer_hand = []
  end 

  def show_hands
    puts "\nDealer hand: #{@dealer_hand}" " | Hand Value: #{hand_value(@dealer_hand)}"
    puts "\nYour hand: #{@player_hand}" " | Hand Value: #{hand_value(@player_hand)}"
  end

  def hit(hand)
    hand.push(random_card)
  end 

  def dealer_decision
    while hand_value(@dealer_hand) < 17 
      puts "\nDealer hits!"
      hit(@dealer_hand)
      show_hands()
    end
  end

  def calculate_conditions
    if hand_value(@dealer_hand) > 21
      puts "\ndealer busts! You WIN!"
      @user[:balance] += @wager
      puts "\nYour new balance is $#{@user[:balance]}"
    elsif hand_value(@player_hand) == hand_value(@dealer_hand)
      puts "\nHand is a push! You get your money back"
    elsif hand_value(@player_hand) > hand_value(@dealer_hand)
      puts "\nYou Win!"
      @user[:balance] += @wager
      puts "\nYour new balance is $#{@user[:balance]}"
    elsif hand_value(@player_hand) < hand_value(@dealer_hand)
      puts "HOUSE WINS. Try again"
      @user[:balance] -= @wager
      puts "Your new balance is $#{@user[:balance]}"
    else
      puts "Something went wrong"
    end
  end 

  def bet
    user_input = false
    until user_input == true
      puts "How much would you like to bet? (Enter amount or Quit)"
      user_input = gets.chomp.to_i
      if user_input > @user[:balance]
        puts "Sorry, you don't have enough money for that bet"
        puts "Your balance is $#{@user[:balance]}"  
      elsif user_input <= @user[:balance]
        @wager = user_input
        puts "All bets are placed!"
        user_input = true
        return
      else
        puts "Invalid Selection"
      end
    end
  end 

  def run_game
    bet()
    starting_hands()
    user_input = ''
    while user_input != "s" && user_input != "stand"
      show_hands()
      if hand_value(@player_hand) == 21
        puts "\BLACKJACK! YOU WIN!"
        @user[:balance] += (@wager * 1.5)
        puts "\nYour new balance is $#{@user[:balance]}"
        return
      end
      puts "\nWould you like to (H)it or (S)tand?"
      user_input = gets.chomp.downcase
      if user_input == 'h' || user_input == 'hit'
        hit(@player_hand)
        if hand_value(@player_hand) > 21
          puts "BUST! Sorry, you LOSE"
          @user[:balance] -= @wager
          puts "\Your new balance is $#{@user[:balance]}"
          return
        end
      elsif user_input == 'S' || user_input == 'stand'
        puts "\Good Luck!"
      else
        puts "\Invalid input, try again"
      end
    end 
    dealer_decision()
    calculate_conditions() 
  end

end


puts "_________________________________________________________________________________________________________"

puts pastel.yellow(font.write("BLACKJACK!"))
game = Play.new
game.main_menu()
puts pastel.red(font.write("BYE!"))

game.hand_value([5,8])

