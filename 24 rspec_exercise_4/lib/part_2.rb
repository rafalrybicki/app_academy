def proper_factors(num)
    arr = [1]
    i = 2

    while i < num
        arr << i if num % i == 0
        i += 1
    end

    arr
end


def aliquot_sum(num)
    proper_factors(num).sum
end


def perfect_number?(num)
    num == aliquot_sum(num)
end


def ideal_numbers(num)
    arr = []
    i = 2
    
    while arr.length < num
        if perfect_number?(i)
            arr << i
        end
        i+=1
    end
    arr
end