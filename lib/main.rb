require_relative "connect_four.rb"
require 'pry-byebug'

game = ConnectFour.new
player = 1

until game.game_over?
    game.print_grid
    column = 0
    puts "Select where to add your token."

    until column.between?(1, 7)
        column = gets.to_i
    end

    game.insert_token(column - 1, player)
    player == 1? player = 2 : player = 1
end

