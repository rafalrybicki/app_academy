class Item

    attr_accessor :title, :deadline, :description 
    attr_reader :done

    def initialize(title, deadline, description)
        raise "invalid date!" if Item.valid_date?(deadline) == false                     
        @title = title
        @description = description
        @deadline = deadline
        @done = false
    end

    def self.valid_date?(date)
        date = date.split('-').map {|s| s.to_i }

        if date[0].to_s.length != 4
            false
        elsif date[1] < 1 || date[1] > 12
            false
        elsif  date[2] < 1 || date[2] > 31
            false
        else
            true
        end
    end

    def deadline=(date)
        raise "invalid date!" if Item.valid_date?(date) == false
        @deadline = date
    end
    
    def toggle
        @done = !@done
    end
end


# Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# # Item.new(
# #     'Fix checkout page',
# #     '10-25-2019',
# #     'The font is too small.'
# # )

# i = Item.new('tytul', '2019-01-01', 'opis')


# # i.toggle

# p i