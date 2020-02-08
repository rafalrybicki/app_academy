def zip(*base)
    array = Array.new(base[0].length) {Array.new}
    length = array.length
    
    length.times do |i|
        base.length.times do |sub_arr|
            array[i] << base[sub_arr][i]
        end
    end

    array
end

def prizz_proc(arr, prc1, prc2)
    new_arr = []
    i = 0

    while i < arr.length
        el = arr[i]
        if prc1.call(el) == true && prc2.call(el) == false
            new_arr << el
        elsif prc2.call(el) == true && prc1.call(el) == false
            new_arr << el
        end

        i += 1
    end

    new_arr
end

def zany_zip(*base)
    length = [*base].max {|a, b| a.length <=> b.length }.length
    array = Array.new(length) {Array.new}

    length.times do |i|
        base.length.times do |sub_arr|
            if base[sub_arr][i]
                array[i] << base[sub_arr][i]
            else
                array[i] << nil
            end
        end
    end
    array
end

def maximum(arr, &prc)
    return nil if arr.empty?

    max = arr[0]
    val = prc.call(arr[0])

    arr.each do |el|
        current = prc.call(el)
        if current >= val
            max = el
            val = current
        end
    end

    max
end

def my_group_by(arr, &prc)
    hash = Hash.new {|h, k| h[k] = [] }

    arr.each do |el|
        k = prc.call(el)
        hash[k] << el
    end

    hash
end

def max_tie_breaker(arr, proc1, &proc2)
    hash = {}
    i = 0

    arr.each_with_index do |el,j|
        current = proc2.call(el)
        prev = proc2.call(arr[i])
        if current > prev 
            i = j
        elsif current == prev && i > 0
            prev = proc1.call(arr[i])
            current = proc1.call(el)
            if current > prev
                i = j
            end 
        end
    end
    arr[i]
end

def silly_syllables(sentence)  
    str = []

    sentence.split(" ").each do |word|

        if vowels_quantiy(word) >= 2
            first = 0
            last = 0
            
            word.each_char.with_index do |char,i|
                if 'aeiou'.include?(char) && first > 0
                    last = i
                elsif 'aeiou'.include?(char) && first == 0 && last == 0
                    first = i 
                    last = i
                end
            end
   
            if first > 0 && last > 0
                str << word[first..last]
            else
                str << word
            end
        else
            str << word
        end
    end
    str.join(" ")
end

def vowels_quantiy(word)
    word.gsub(/[^aeiou]/, '').length
end