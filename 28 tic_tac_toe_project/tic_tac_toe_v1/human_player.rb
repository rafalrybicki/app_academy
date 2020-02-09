class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        col = false
        row = false
        position = {}
        p mark
        p 'enter the column number'
        
        while col == false
            col = gets.chomp
            if col.to_i > 0 && col.length == 1
                col = col.to_i
                position[:col] = col -1 
            else
                p 'enter the correct column number'
                col = false
            end
        end

        p 'enter the row number'

        while row == false
            row = gets.chomp
            if row.to_i > 0 && row.length == 1
                row = row.to_i
                position[:row] = row - 1
            else
                p 'enter the correct row number' 
                row = false
            end
        end

        position  
    end


end
