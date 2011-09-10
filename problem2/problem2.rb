#!/usr/local/env/ruby -wKU

class Fibonacci
  def initialize(size)
    @sequence = self.fib_sequence(size)
  end
  
  attr_reader :sequence

  def fib_sequence(size)
    seq = [0,1]
    x,y = 0,1
    
    while (seq.last < size) do
      seq.push(x+=y)
      x,y=y,x 
    end
    
    seq
  end
  
 def sum_evens
   running_sum = 0
   @sequence.each { |e| 
     if e % 2 == 0
        running_sum += e
     end
   }
   running_sum
 end
  
end

fib = Fibonacci.new(4000000)
puts fib.sequence
puts "the sum of evens is: #{fib.sum_evens}"