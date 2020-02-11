require_relative 'list.rb'

class TodoBoard

    def initialize(label)
        @list = List.new(label)    
        @lists = {}    
    end

    def seed 
        @lists['cars'] = List.new('cars')
        @lists['zakupy'] = List.new('zakupy')
        @lists['cars'].add_item('tytyl1', '2020-10-10', 'opis1')
        @lists['cars'].add_item('tytyl2', '2020-10-01', 'opis2')
        @lists['cars'].add_item('tytyl3', '2020-11-10', 'opis3')
        @lists['cars'].add_item('tytyl4', '2020-10-01', 'opis42')
        @lists['cars'].add_item('tytyl5', '2020-11-10', 'opis33')
        @lists['zakupy'].add_item('tytyl1', '2020-10-20', 'opis4')
        @lists['zakupy'].add_item('tytyl2', '2020-10-30', 'opis5')
        @lists['zakupy'].add_item('tytyl3', '2020-10-20', 'opis4234')
        @lists['zakupy'].add_item('tytyl4', '2020-10-30', 'opis5we')
    end

    def get
        puts 'type a command'
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mklist'
            @lists[args[0]] = List.new(args[0])
        when 'ls'
            @lists.each {|k,v| p v.label }
        when 'mktodo'
            @lists[args[0]].add_item(args[1], args[2], args[3])
        when 'showall'
            @lists.each {|k,v| v.print }
            true
        when 'up'
            @lists[args[0]].up(args[1].to_i, args[2].to_i) # nil.to_i => 0
        when 'down'
            @lists[args[0]].down(args[1].to_i, args[2].to_i) # nil.to_i => 0
        when 'swap'
            @lists[args[0]].swap(args[1].to_i, args[2].to_i)
        when 'sort'
            @lists[args[0]].sort_by_date!
        when 'priority'
            @lists[args[0]].priority
        when 'print'
            if args[1]
                @lists[args[0]].print_full_item(args[1].to_i)
            else
                @lists[args[0]].print
            end
        when 'toggle'
            @lists[args[0]].toggle_item(args[1].to_i) 
        when 'rm'
            @lists[args[0]].remove_item(args[1].to_i)

        when 'purge'
            @lists[args[0]].purge
        when 'quit'
            return false
        else
            puts "Sorry, that command is not recognized."
            puts 'type help to get more information'
            get_command
        end
    end


end
