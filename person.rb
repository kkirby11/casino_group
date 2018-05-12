require_relative 'wallet'
require_relative 'casino_war'
require_relative 'roulette'
require_relative 'ascii_casino'
require 'pry'

class Person
  attr_accessor :person_wallet 

  def initialize
    Banner.new
    @person_wallet = Wallet.new
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "You find yourself in a casino and you have a massive gambling problem"
    puts "You currently have $100 in your pocket"
    puts "Are you ready to begin? Y/N"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    gets.strip.downcase == "y" ? choose_game : (puts "K let's start over" ; initialize)

  end

 #send people here after they play a game, show them their wallet and then let them choose next game
  def casino_floor
    puts
    puts "Welcome back!"
    @person_wallet.show_wallet
    choose_game
  end

  #This menu will pop up anytime the user is sent back to the 'casino-floor', it will allow them to choose the game they want to play
  def choose_game
    puts "Please choose from the following options:"
    puts "1) Roulette"
    puts "2) Casino War"
    puts "3) Black or Red"
    puts "4) Slots"
    puts "5) Show wallet balance"
    puts "6) Cash out and leave"
    answer = gets.strip.to_i
    case answer
    when 1
      play_roulette
    when 2
      play_casino_war
    when 3
      puts "under construction"
    when 4
      puts "under construction"
    when 5
      @person_wallet.show_wallet
      choose_game
    when 6
      @person_wallet.final_wallet
      exit
    end
  end

  def play_casino_war
    puts "How much would you like to bet?"
    @bet = gets.to_f
    bet_condition

    casino_war_game = CasinoWar.new(@bet)
    update_wallet = casino_war_game.return_amount
    @person_wallet.win_wallet(update_wallet)
    play_casino_war_again
  end

  def play_casino_war_again
    puts "Would you like to play Casino War again? Y/N"
    play_again = gets.strip.downcase
    if play_again == 'y'
      play_casino_war
    elsif play_again == 'n'
      casino_floor
    else
      puts "invalid choice, please choose again."
    end
  end

  def play_roulette
    puts "How much would you like to bet?"

    @bet = gets.to_f
    roulette = Roulette.new(@bet)
    puts roulette

  end

  def bet_condition
    if @bet > @person_wallet.wallet
      puts "Sorry, you don't have that much money left..."
      puts "Please bet a smaller amount\n\n" 
      play_casino_war 
    end
  end


end

player1 = Person.new