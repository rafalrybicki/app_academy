def my_map(arr, &prc)
    new_arr = []
    arr.each{ |el| new_arr << prc.call(el)}
    new_arr
end

def my_select(arr, &prc)
    new_arr = []
    arr.each do |el|
        new_arr << el if prc.call(el)
    end
    new_arr
end

def my_count(arr, &prc)
    counter = 0
    arr.each do |el|
        counter+=1 if prc.call(el)
    end
    counter
end

def my_any?(arr, &prc)
    passed = false
    arr.each do |el|
        passed = true if prc.call(el)
    end
    passed
end

def my_all?(arr, &prc)
    passed = true
    arr.each do |el|
        passed = false if !prc.call(el)
    end
    passed
end

def my_none?(arr, &prc)
    passed = true
    arr.each do |el|
        passed = false if prc.call(el)
    end
    passed
end