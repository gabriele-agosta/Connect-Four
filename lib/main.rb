require_relative "connect_four.rb"
require 'pry-byebug'

game = ConnectFour.new
player = 0

until game.game_over?(player)
  player = player == 1 ? 2 : 1
  game.print_grid
  column = 0
  puts "It's your turn Player #{player}!"
  puts "Select in which column to insert your token"
  column = gets.to_i until column.between?(1, 7)
  game.insert_token(column - 1, player)
end

