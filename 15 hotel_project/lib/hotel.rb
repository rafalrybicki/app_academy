require_relative "room"

class Hotel
    def initialize(name, rooms)
        @name = name
        @rooms = rooms.inject({}) do |acc, room|
            acc[room[0]] = Room.new(room[1])
            acc
        end
    end

    def name 
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room)
        @rooms.has_key?(room)
    end

    def check_in(person, room_name)
        if !room_exists?(room_name)
            p 'sorry, room does not exist'
        elsif @rooms[room_name].add_occupant(person) 
            p 'check in successful'
        else
            p 'sorry, room is full'
        end
    end

    def has_vacancy?
        @rooms.any?{|k,room| !room.full?}
    end

    def list_rooms
        @rooms.each do |k,v|
            puts "#{k} : #{v.available_space}\n"
        end
    end

end
