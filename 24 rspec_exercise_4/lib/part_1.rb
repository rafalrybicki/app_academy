def my_reject(arr, &prc)
    new_arr = []

    arr.each do |el|
        if prc.call(el) == false
            new_arr << el
        end
    end

    new_arr
end


def my_one?(arr, &prc)
    exist = false

    arr.each do |el|
        if prc.call(el) == true && exist == false
            exist = true
        elsif 
            prc.call(el) == true && exist == true
            return false
        end
    end

    exist
end


def hash_select(hash, &prc)
    new_hash = {}

    hash.each do |k,v|
        if prc.call(k,v) == true
            new_hash[k] = v
        end
    end

    new_hash
end


def xor_select(array, prc1, prc2)
    arr = []

    array.each do |el|
        if (prc1.call(el) == false && prc2.call(el) == true) || (prc1.call(el) == true && prc2.call(el) == false)
            arr << el
        end
    end

    arr
end


def proc_count(val, arr)
    count = 0
    
    (arr.length).times do |i|
        count += 1 if arr[i].call(val) == true
    end 

    count
end