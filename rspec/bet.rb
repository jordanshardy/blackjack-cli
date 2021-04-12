def bet(wager)
    user_input = 50
    user_balance = 100
    wager = 0

    user_input = false
    until user_input == true
      puts "How much would you like to bet? (Enter amount or Quit)"
      user_input = gets.chomp.to_i
      if user_input > user_balance
        puts "Sorry, you don't have enough money for that bet"
        puts "Your balance is $#{user_balance}"  
      elsif user_input <= user_balance
        wager = user_input
        puts "All bets are placed!"
        user_input = true
        return wager
      else
        puts "Invalid Selection"
      end
    end
  end 