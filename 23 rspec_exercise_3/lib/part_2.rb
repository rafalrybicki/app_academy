def element_count(arr)
    h = Hash.new(0)
    arr.each {|el| h[el] += 1}
    h
end

def char_replace!(str, hash)
    str = str.each_char.with_index do |el,i|
        if hash.has_key?(el)
            str[i] = hash[el]
        else
            el
        end
    end

    str
end

def product_inject(arr)

    arr.inject(1) {|acc,n| acc *= n; acc}

end