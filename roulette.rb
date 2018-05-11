#require 'pry'

class Roulette
attr_accessor :place_bet

def initialize(bet)
  @bet = bet
  @index = [0, 00, 2, 4, 7, 9, 10, 12, 15, 17, 18, 20, 23, 25, 26, 28, 31, 33, 34, 36, 1, 3, 5, 6, 8, 11, 13, 14, 16, 19, 21, 22, 24, 27, 29, 30, 32, 35]
  @color = ['Red', 'Black']
  play
end

def play
  puts 
  puts "************** Roulette *****************"
  puts
  puts "Try your luck, spin the wheel, and prepare for big wins!"
  puts "Or maybe you'll lose it all because of your poor life choices!"
  puts
  puts '========================================='
  place_bet
end

def place_bet
  puts "Place your bet:"
  puts "1) Red\n2) Black\n3) Pick a single number"
  print "> "
  bet = gets.to_i
  case bet
  when 1
    @colorchoice = 'Red'
  when 2
    @colorchoice = 'Black'
  else
    number
  end
    color
end

def number
    puts "In Roulette you can pick a number between 1 and 36, 0(zero), or 00(double zero)"
    num_bet = gets.to_i
  if num_bet == @index.sample
    puts "Incredible, you win! You are the roulette master!"
    @bet += @bet
  else
    puts "Ouch wah-wah! You have lost everything!"
    @bet -= @bet
  end
end


def color
  if @colorchoice == @color.sample
    puts "You're a winner!"
    @bet += @bet
  else
    puts "You have lost pretty horrifically, sorry."
    @bet -= @bet
  end
end


end