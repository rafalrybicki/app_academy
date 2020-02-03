def all_words_capitalized?(arr)
    arr.all? { |word| word.capitalize == word}
end

def forbidden_url?(str)
    str.end_with?('.com', '.net', '.io', '.org')
end


def no_valid_url?(arr)
    arr.none? { |url| forbidden_url?(url) }
end

def average_grade(arr)
    arr.sum / arr.length
end

def any_passing_students?(arr)
    arr.any? { |student| average_grade(student[:grades]) >= 75}
end