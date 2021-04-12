require 'tty-prompt'
require 'json'

def main_menu(user_balance)
    prompt = TTY::Prompt.new 
    finished = false
    user_balance = 500
    while finished == false
      user_input = prompt.select("\nWelcome, Please choose from the following options") do |menu|
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
      puts "\nYour bank balance is $#{user_balance}"
      return user_balance
    elsif user_input == 'View Ratio'
      puts "\nYour win/loss ratio is #{ratio}"
    elsif user_input == 'Play Game'
      run_game() 
      clear_hands()
    else user_input == 'Quit'
      finished = true
      update_file()
    end
    end
  end