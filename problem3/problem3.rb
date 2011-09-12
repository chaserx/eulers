#!/usr/local/env/ruby -wKU

# going to include .rvmrc
# tested with 1.9.2
puts "Ruby version: #{RUBY_VERSION}"

# credits
# http://en.wikipedia.org/wiki/Trial_division
# http://stackoverflow.com/questions/241691/sieve-of-eratosthenes-in-ruby
# http://stackoverflow.com/questions/719049/fixnum-and-prime-numbers-in-ruby
# http://on-ruby.blogspot.com/2006/07/rubyinline-making-making-things-faster.html

class Factorization

  
  def initialize(args)
    @factors = []
    self.trial_division(args)
  end
  
  attr_reader :factors
  
  def trial_division(num)
    primes = []
    if num == 1
      primes.push(1)
    else
      primes = primeSieve((num**0.5)+1)
    end
    for p in primes
      if p*p > num
        break
      else
        while num % p == 0
          @factors.push(p)
          num = (num/p).floor
          if num > 1
            @factors.push(num)
          end
        end
      end
    end
  end
  
  def primeSieve(n)
    s = (0..n).to_a
      s[0] = s[1] = nil
      s.each do |p|
        next unless p
        break if p * p > n
        (p*p).step(n, p) { |m| s[m] = nil }
      end
      s.compact
  end
  
  
end

number = 600851475143

factor = Factorization.new(number/2)
puts factor.factors

#  AJ suggests
#- find all primes n/2
#- start from greatest prime divide into n, first integer solves the problem.
#- with the solution being the prime
#- actualy, don't have to goto n/2 since n is odd
#- start by dividing n by the integers greater than 0... testing each integer for primeness... the first prime is the solution