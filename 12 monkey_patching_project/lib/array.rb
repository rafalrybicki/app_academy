# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        self.empty? ? nil : self.max - self.min
    end

    def average
        self.empty? ? nil : self.sum / self.length.to_f
    end

    def median
        return nil if self.empty?

        sorted = self.sort
        middle = self.length / 2

        if self.length.odd?
            sorted[middle]
        else
            sorted[middle-1, 2].average
        end

    end

    def counts 
        self.inject(Hash.new(0)) { |acc, el| acc[el] +=1; acc }
    end

    def my_count(num)
        self.inject(0) { |acc, el| acc += 1 if num == el; acc}
    end

    def my_index(num)
        self.each_with_index {|el, i| return i if el == num}
        nil
    end

    def my_uniq
        hash = Hash.new(0)

        self.map { |el| hash[el] += 1}

        hash.keys
    end

    def my_transpose
        new_arr = Array.new(self.length) {Array.new}

        self.each do |sub_arr|
            sub_arr.each_with_index do |el, i|
                new_arr[i] << el
            end
        end
        new_arr
    end

end
