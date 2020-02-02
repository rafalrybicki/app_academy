def partition(arr, num)
    arr.inject([[],[]]) do |acc, el|
        if el < num
            acc[0] << el
        else
            acc[1] << el
        end
        acc
    end
end

def merge(hash_1, hash_2) 
    hash = {}

    hash_1.each {|k,v| hash[k] = v}
    hash_2.each {|k,v| hash[k] = v}

    hash
end

def censor (str, arr)
    def censor_vowels(word)
        word.gsub(/[aeiou]/i, '*')   
    end

    str.split(" ").map! do |word|
        if arr.index(word.downcase)
            censor_vowels(word)
        else
            word
        end
    end
    .join(" ")
end

def power_of_two?(num)
    return true if num == 1
    i = 1
    power_of_i = 1

    while power_of_i <= num
        power_of_i *= 2
        return true if power_of_i == num
    end

    false
end