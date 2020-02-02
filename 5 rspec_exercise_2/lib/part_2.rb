def palindrome?(str)
    str.split("").reverse.join("") == str 
end

def substrings(str)
    arr = []
  
    str.each_char.with_index do |char, index|
        current = index
        (str.length - current).times do 
            arr << str[index..current]
            current +=1
        end
    end

    arr
end

def palindrome_substrings(str)
    substrings(str).select {|substring| substring.length > 1 && palindrome?(substring)}
end