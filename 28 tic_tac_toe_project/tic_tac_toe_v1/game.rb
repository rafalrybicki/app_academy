require_relative 'board.rb'
require_relative 'human_player.rb'

class Game < HumanPlayer

    def initialize(player_1_mark, player_2_mark)
        @player_1_mark = HumanPlayer.new(player_1_mark)
        @player_2_mark = HumanPlayer.new(player_2_mark)
        @current = @player_1_mark
        @board = Board.new
        @counter = @board.board.flatten.length 
        play
    end

    def switch_turn
        @current == @player_1_mark ? @current = @player_2_mark : @current = @player_1_mark
        play
    end

    def play 
        @board.print
        position = @current.get_position
        col = position[:row]
        row = position[:col]
        if @board.empty?(col, row)
            @board.place_mark(col,row,@current.mark)
            @counter -= 1
        end

        if @board.win?(@current.mark) 
            return p "#{@current.mark} WIN"

        elsif @counter == 0
            return p 'DRAW'
        end

        switch_turn
    end
end