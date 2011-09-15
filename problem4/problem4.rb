#!/usr/local/env/ruby -wKU

# Euler problem 4
# Chase Southard
# Started: 9.14.11
# using ruby 1.9.2
# credits:
# http://stackoverflow.com/questions/199184/how-do-i-check-if-a-number-is-a-palindrome
# 

require 'pry'

class Pallindrome
  def initialize(args)
    @num = args
  end
  
  attr_accessor :num
  
  def is_pallindrome?
    n = self.num
    rev = 0
    while (self.num > 0) do
      dig = self.num % 10
      rev = rev * 10 + dig
      self.num = self.num / 10
    end
    
    #puts "Number #{n} #{(n == rev ? "IS" : "IS NOT")} a pallindrome."
    
    return n == rev ? TRUE : FALSE
  end
  
  def self.generate_all_3_digit_products
    min = 100
    max = 999
    start = 100
    stepper = 100
    factors = []
    while (stepper < 1000) do
      factors.push(start*stepper) 
      stepper = stepper.next
    end
    binding.pry
    puts factors
  end
  
  def reduce_array_to_only_pallindromes
    
  end
  
end


p = Pallindrome.new(9009)
puts p.is_pallindrome?
Pallindrome.generate_all_3_digit_products
