def select_even_nums(arr) 
    arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject { |puppy| puppy['age'] <= 2 }
end

def count_positive_subarrays(arr) 
    arr.count { |sub_arr| sub_arr.sum > 0 } 
end

def aba_translate(str)
    vowels = 'aeiou'
    new_str = ""

    str.each_char do |char|
        if vowels.include?(char)
            new_str += char + 'b' + char
        else
            new_str += char
        end
    end

    new_str
end

def aba_array(arr)
    arr.map { |str| aba_translate(str)}
end