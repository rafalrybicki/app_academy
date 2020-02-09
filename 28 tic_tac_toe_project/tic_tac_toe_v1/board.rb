class Board
    attr_reader :board

    def initialize
        @board = [
            ['-', '-', '-'],
            ['-', '-', '-'],
            ['-', '-', '-']
        ]
    end

    def empty?(row, col)
        p "board  #{@board[row][col]}"
        @board[row][col] == '-'
        
    end

    def place_mark(row, col, mark)
        
        if empty?(row, col)
            @board[row][col] = mark 
            true
        else
            false
        end
    end

    def print
        @board.each do |row|
            p row
        end
    end

    def win_row?(mark)
        @board.each do |row|
            i = 0
            win = false
            while i < row.length
                if row[i] == mark
                    win = true
                else
                    win = false
                    break
                end
                i += 1
            end
            return true if win == true
        end

        false
    end

    def win_col?(mark)
        @board.each_with_index do |row, row_index|
            col_index = 0
            win = false
            while col_index < row.length
                if @board[col_index][row_index] == mark
                    win = true
                else
                    win = false
                    break
                end
                col_index += 1
            end
            return true if win == true
        end
        false
    end

    def win_diagonal?(mark)
        left_diagonal = true
        right_diagonal = true

        diagonals[0].each do |position|
            row = position[:row]
            col = position[:col]
            if @board[row][col] != mark
                left_diagonal = false
                break
            end
        end

        diagonals[1].each do |position|
            row = position[:row]
            col = position[:col]
            if @board[row][col] != mark
                right_diagonal = false
                break
            end
        end

        left_diagonal || right_diagonal
    end 

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end


    def diagonals
        p @board
        left = []
        right = []

        @board.each_with_index do |row, i|
            left << {col: i, row: i}
        end

        start = { row: @board.length - 1, col: 0 }

        @board.each do |row|
            right << { col: start[:col], row: start[:row] }
            start[:col] += 1
            start[:row] -= 1
        end
        [left, right]
    end


end
