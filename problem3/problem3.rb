#!/usr/local/env/ruby -wKU

# going to include .rvmrc
# tested with 1.9.2
puts "Ruby version: #{RUBY_VERSION}"

# credits
# http://en.wikipedia.org/wiki/Trial_division
# http://stackoverflow.com/questions/241691/sieve-of-eratosthenes-in-ruby
# http://stackoverflow.com/questions/719049/fixnum-and-prime-numbers-in-ruby
# http://on-ruby.blogspot.com/2006/07/rubyinline-making-making-things-faster.html
# http://en.wikibooks.org/wiki/Algorithm_Implementation/Mathematics/Prime_number_generation
# http://snippets.dzone.com/posts/show/4636

#  AJ suggests:
#- find all primes n/2
#- start from greatest prime divide into n, first integer solves the problem.
#- with the solution being the prime
#- actualy, don't have to goto n/2 since n is odd
#- start by dividing n by the integers greater than 0... testing each integer for primeness... the first prime is the solution

class Factorization

  
  def initialize(args)
    @prime_factors = []
    @factors = []
    self.trial_division(args)
    self.find_prime_factors
  end
  
  attr_reader :factors, :prime_factors
  
  def trial_division(num)
    primes = []
    if num == 1
      primes.push(1)
    else
      #primes = primeSieve(num/2)
      # not quite sure on the math, but this works much faster num/2 or num
      # (num**0.5)+1 >> num/2 >>>>> num
      primes = primeSieve((num**0.5)+1)
      #primes = sieve_of_eratosthenes(num/2)
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
  
  def find_prime_factors
    for f in @factors
      if f.is_prime?
        @prime_factors.push(f)
      end
    end
  end
  
  # faster than sieve below
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
  
  def sieve_of_eratosthenes(max)
    arr=(2..max).to_a
    (2..Math::sqrt(max)).each do |i|
       arr.delete_if {|a|a % i == 0 && a!=i}
     end
     arr
  end
  
end

# http://snippets.dzone.com/posts/show/4636
# all this below is to test for primeness
class Integer
def bitarray(n) 
    b=Array::new  
    i=0       
    v=n
    while v > 0
      b[i] = (0x1 & v)
      v = v/2
      i = i + 1
    end
    return b
end
def miller_rabin(n,s)
    b=bitarray(n-1)
    i=b.size 
    j =1
    while j <= s
      a = 1 + (rand(n-2).to_i)
      if witness(a,n,i,b) == true
	return false
      end
      j+=1
    end
    return true
end
def witness(a,n,i,b)
    d=1
    x=0
    while i > 0 
      x = d 
      d = (d**2) % n
      if ( (d == 1) && (x != 1) && (x != (n-1)) )
	return true
      end
      if ( b[i-1] == 1 )
	d = (d * a ) % n
      end
      i -= 1
    end
    if ( d != 1) 
      return true
    end
    return false
end

  #def prime?
  def is_prime?
    a = self
    return miller_rabin(a,30)    
  end

  def bytesize
    n = self
    i=0
    while n > 0
      n = n >> 8
      i += 1
    end
    return i
  end
  
  def bitsize
    n = self
    i=0
    while n > 0
      n = n >> 1
      i += 1
    end
    return i
  end
end

number = 600851475143
#number = 13195
factor = Factorization.new(number)
puts "potential factors"
puts factor.factors
puts "---"
puts "potential prime factors"
puts factor.prime_factors

