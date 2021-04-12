# Blackjack Ruby CLI Game

Source code: (https://github.com/jordanshardy/blackjack-cli.git)

## Description

**Blackjack** is a single player, common card game that is played all over the world in casinos. The game follows conventional blackjack rules and conditions that allow a player to make bets, hit or stand on hands and play their chance against the dealer.

The app also features an oppotunity for players to earn more money by correctly answering prompts about hand and card odds. The game will...

## Statement of Purpose and Scope

The Problem

After losing memories and some brain function (including most of my math) in a motorcycle accident in 2019, I forgot how to play blackjack competitively. I’ve been wanting to relearn blackjack strategy and hand odds and so this app will help me do so.

Target Audience

Blackjack is a fun and exciting way to kill time on the computer while teaching basic math and increasing memory function. This game will help users in understanding hand odds, calculating bets and payouts, and feeling a small satisfying rush when the dealer's second card is turned over revealing they’ve hit 22 and the user wins! The app will be built with my own situation in mind, but will also help users that are new to the game and looking to up their hands against the house next time they’re in the casino!

Usage

Once a user creates a login, they have access to their win/loss ratio to track progress and their ‘bank account’, where they will have access to a betting balance.

When a user creates a login, they will be given an initial amount of money to place bets. If and when a user loses a hand, their bet will be subtracted from their total. Once a user’s balance is zero, the app will inform them they’re out of money and give them another cash injection. Users will also have a chance to win money by answering questions about hand/card odds correctly. Utilizing a cash injection feature after losing will keep the user from placing frivolous bets, creating a more realistic playing environment.

The user will start a game and be drawn 2 cards, the dealer will also be drawn 2 cards, one of which will be face down. The user will then be asked “What are the odds?”, and have to answer a series of questions about the odds for their hand. If they get the answers incorrect, the odds will be displayed on the screen and the game continues, if they get the answer correctly they will receive a reward payment added to their balance. They will then be asked to choose to ‘Hit’ and receive another card, or ‘Stand’ and move on.

After the turn, given they haven’t gone ‘Bust’, the dealer will turn their second card over and either take more cards following the standard rules for blackjack (Basic blackjack rules will be posted in application instructions) or ‘Stand’; at this point, the winner will be announced, adding or subtracting the bet from their total and then have the choice to play another game.


## Features and Functionality

Menu

The menu utilizes the TTY-prompt gem to give the user an easy way to access all of the items in the menu. The menu will consist of a rules section, to tell the user how to play black jack, an option to check their bank balance, an option to check their win loss ratio and an option to play the game. The menu is a great starting point for the user as it enables them to easily navigate through the app. The options like balance and ratio are printed right onto the screen and loop through, asking them once again what they would like to do. The menu also appears after each game, and so if a user wants to check their ratio after each game or their balance they can do so. The final option in the menu is to quit, allowing the user to exit the application.

Betting

Blackjack has the option to place bets and this app is no different. The user has the option to place bets on each hand after being asked by the app, they will not be able to place a bet higher than their balance. The bets are fairly simple in blackjack and pay out 1:1, or 3:2 if hitting blackjack (Ace, 10) on the pocket hand. A user’s bet will be added to their balance if they win and subtracted if they lose. The user will always be prompted at the end of a hand what their new balance is after they either win or lose.

User

The app has a user feature that saves the players information for future use. Being able to track your odds, win/loss ratio and your bank balance is important when making decisions about bets you make. To do so, they app will utilize an external document (JSON file) to save a users information, allowing them to close the application and still access it later. If a user were to play a few hands, quit the app, come back to the app and not be able to access their original bank balance, it would be detrimental to teaching them about betting risk and bet/odd risk. They would also get sick of the game as video blackjack can be quite boring if there’s nothing on the line. Keeping a users balance, ratio and odds allows them to better track their games and provides a more realistic playing environment.


## Control Flow Diagram

<img src="../docs/control-flow.jpg">


### Implementation Plan

https://trello.com/b/Ir2HoXRh/t1a3-terminal-application


## Help Documentation

 

### Dependencies

The app made use of third-party gem (extensions) to enhance the graphical user interface experience:
* TTY-Prompt (https://github.com/piotrmurach/tty-prompt.git)
* TTY-Pastel (https://github.com/piotrmurach/pastel.git)
* TTY-Font (https://github.com/piotrmurach/tty-font.git)
* Rspec (https://github.com/rspec/rspec.git)

## Installation Instructions
 
 1. Clone this repo (https://github.com/jordanshardy/blackjack-cli.git) or download black-cli.zip directly to your computer.
 2. Open your systems terminal
 3. Navigate to ```blackjack-cli/src```
 4. Run the bash script ```./app-scipt```

 This script will install all needed gem files and run the main.rb file to initiate the game.


## Instructions for use

After running the script Blackjack will start and print a menu to the terminal screen

<img src="blackjack-cli/docs/main-menu.jpg">

From the menu a user can choose to: 
- View Balance

This displays the users bank/bet balance to the screen. The balance is automatically updated to the users external file.

- View Ratio

This displays the Users Win/loss ratio to the screen.

- View Rules

This displays the basic rules and how to play Blackjack 

-Play Game

This initiates the game. Once the game starts, the user will be prompted to place a bet.

<img src="../docs/bet-prompt>

The user will be dealt 2 cards, and the dealer 1 card. both hands are displayed on the screen and the user has the choice to 'Hit' (add a card to their hand) or 'Stand'. When the player stands the program will deal cards to the dealer. At this point the app will determine a winner based on the rules of Blackjack.

<img src="../docs/calculate>
