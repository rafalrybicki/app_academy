def hipsterfy(str)
    vowels = "aeiou"
    last_vowel = false
    new_str = ""
    i = str.length - 1

    while i >= 0
        if last_vowel == false && vowels.index(str[i])
            last_vowel = true
        else
            new_str += str[i]
        end

        i -= 1
    end
    new_str.reverse
end

def vowel_counts(str)
    vowels = "aeiou"
    hash = Hash.new(0)
    str.downcase.split("").each do |el| 
        hash[el] += 1 if vowels.index(el) 
    end
    hash
end

def caesar_cipher(str, num)
    new_str = str.codepoints.to_a.map{|el| el+num}.map do |el|
    if el > 122
      diff = el - 122
      (96 + diff).chr
    else
      el.chr
    end
  end

    new_str.join("")
end

def caesar_cipher(str, num)
    new_str = ""

    str.codepoints.to_a.each do |el|
        if el >96 && el <123
            num % 26 == 0 ? char_nr = el : char_nr = el + num
            if char_nr > 122
                diff = char_nr - 122
                new_str += (96 + diff).chr
            else
                new_str += char_nr.chr
            end
        else
            new_str += el.chr
        end
    end

    new_str
end

# expect(caesar_cipher("123 _-!?@%", 3)).to eq("123 _-!?@%")
# expect(caesar_cipher("hello world!", 1)).to eq("ifmmp xpsme!")
# expect(caesar_cipher("welcome to week 3, day 1", 2)).to eq("ygneqog vq yggm 3, fca 1")

# caesar_cipher("123 _-!?@%", 3)
# caesar_cipher("hello world!", 1)
# caesar_cipher("welcome to week 3, day 1", 2)
caesar_cipher("whoa", 52)