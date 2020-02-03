# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num) 
    i = num 
    while num >= 2 
        if  prime?(num)
            return num
        elsif num % i == 0 && prime?(i)
            return i
        end
        i -= 1
    end
end

def prime?(num)
    return false if num < 2

    (2...num).each do |factor|
        return false if num % factor == 0
    end

    true
end

def unique_chars?(str)
    hash = Hash.new(0)

    str.each_char {|c| hash[c] += 1}

    hash.values.all?(1)
end

def dupe_indices(arr) 
    hash = {}
    arr.each_with_index do |char, i|
        if hash[char]
            hash[char] << i
        else
            hash[char] = [i]
        end
    end
    hash.select{|k,v| v.length > 1}
end

def ana_array(arr1, arr2)
    return false if arr1.length != arr2.length

    arr1.each do |el|
        index = arr2.index(el)
        if index
            arr2.delete_at(index)
        else
            return false
        end
    end
    true
end