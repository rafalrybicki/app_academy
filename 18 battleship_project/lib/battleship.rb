require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts "ships to sunk: #{@board.num_ships}"
        p @board.print
    end

    def lose?
        if @remaining_misses > 0 
            false
        else
            p 'you lose'
            true
        end
    end

    def win?
        if @board.num_ships == 0
            p 'you win'
            true
        else
            false
        end
    end

    def game_over?
        lose? || win?
    end

    def turn
        attack_successful = @board.attack(@player.get_move)
        @board.print
        @remaining_misses -=1 if !attack_successful
        puts "remaining misses: #{@remaining_misses}"
    end

end
