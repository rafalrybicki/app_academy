class Board 
    attr_reader :size

    def self.print_grid(grid)
        grid.each {|row| puts "#{row.join(' ')}\n"}
    end

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n*n
    end

    def [](position)
        row, column = position
        @grid[row][column]
    end

    def []=(position, value)
        row, column = position
        @grid[row][column] = value
    end

    def num_ships
        @grid.flatten.count{|el| el == :S}
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            p 'you sunk my battleship!'
            true
        else
            self[position] = :X
            false
        end
    end

    def place_random_ships
        (@size / 4).times do 
            length = @grid.length
            placed = false
            while placed == false do
                position = [rand(0...length), rand(0...length)] 
                if self[position] == :N 
                    self[position] = :S 
                    placed = true
                end
            end
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map {|col| col == :S ? :N : col }
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
