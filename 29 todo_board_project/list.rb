require_relative 'item.rb'

class List
    attr_reader :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = '')
        begin
            item = Item.new(title, deadline, description)
            @items << item 
            true
        rescue
            p 'something went wrong'
            false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        index >= 0 && @items[index] ? true : false
    end

    def swap(index_1, index_2)
        if @items[index_1] && @items[index_2]
            @items[index_1],@items[index_2] = @items[index_2],@items[index_1]
            true
        else
            false
        end
    end

    def [](index)
        @items[index] ? @items[index] : false
    end

    def priority
        @items[0]
    end

    def print
        # puts ''.ljust(50, '-')
        puts @label.center(50)
        puts ''.ljust(50, '-')
        puts 'INDEX  ITEM                      DEADLINE    DONE '
        puts ''.ljust(50, '-')

        @items.each_with_index do |item, index|
            puts "  #{index.to_s.ljust(5)} #{item.title.ljust(23)} #{item.deadline}  #{item.done} "
        end

        puts ''.ljust(50, '-')
        return 
    end

    def print_full_item(index)
        if self[index] 
            item = @items[index]
            puts "#{item.title.ljust(32)}#{item.deadline}  #{item.done}"
            puts item.description
            puts ''.ljust(50, '-')
        else
            false
        end
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount)
        amount = 1 if amount == 0

        if index < 0 || index > @items.length - 1
            p 'invalid index!'
            return false 
        elsif index == 0
            return true
        end

        item = @items.delete_at(index)
        if index - amount <= 0
            @items.unshift(item)
        else
            new_index = index - amount
            @items.insert(new_index, item)
        end
        'done'
    end

    def down(index, amount)
        amount = 1 if amount == 0

        if index < 0 ||index > @items.length - 1
            p 'invalid index!'
            return false 
        elsif index == @items.length - 1
            return true
        end

        item = @items.delete_at(index)

        if index + amount >= @items.length - 1
            @items << item
        else
            new_index = index + amount
            @items.insert(new_index, item)
        end

        'done'
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

    def toggle_item(index)
        return 'invalid index!' if index < 0 || index > @items.length - 1
        @items[index].toggle
    end

    def remove_item(index)       
        if @items[index]
            @items.delete_at(index)
            'item was successfuly deleted'
        else
            "invalid index! given: #{index}"
        end
    end

    def purge
        @items.select! {|item| p item.done == false}
        'done items was deleted!'
    end
end



# l = List.new('test')

# l.add_item('tytyl', '2020-10-10', 'opis')

# l.add_item('tytyl2', '2020-10-01', 'opis2')

# l.add_item('tytyl3', '2020-11-10', 'opis3')

# l.add_item('tytyl4', '2020-10-20', 'opis4')

# l.add_item('tytyl5', '2020-10-30', 'opis5')

# l.toggle_item(1)


# l.purge 

# l.print
