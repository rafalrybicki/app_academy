def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    arr.sum / arr.length.to_f
end

def repeat(str, num)
    str * num
end

def yell(str) 
    str.upcase + "!"
end

def alternating_case(str)
    str.split(" ").each_with_index{ |elem, i| i % 2 == 0 ? elem.upcase! : elem.downcase!}.join(" ")
end