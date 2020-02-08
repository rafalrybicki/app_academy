def is_prime?(num)
    return false if num < 2
    return true if num == 2

    (2...num).each do |i|
        return false if num % i == 0
    end

    true
end

p is_prime?(5)

def nth_prime(num)
    primes = []
    n = 2

    while primes.length < num
        if is_prime?(n)
            primes << n
        end
        n += 1
    end

    primes.last
end

def prime_range(min, max)
    primes = []

    (min..max).each do |num|
        primes << num if is_prime?(num)
    end

    primes
end