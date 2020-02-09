require_relative "passenger"

class Flight

    def initialize(flight_number, capacity)
        @flight_number = flight_number.upcase
        @capacity = capacity
        @passengers = []
    end

    def passengers
        @passengers
    end

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(passenger)
        return if full?
        if passenger.has_flight?(@flight_number)
            @passengers << passenger
        end
    end

    def list_passengers
        @passengers.map {|p| p.name}
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        board_passenger(passenger)
    end
end