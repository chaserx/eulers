#!/usr/local/bin/ruby

# Goal
# Find the sum of all the multiples of 3 or 5 below 1000.

# create range
range = 1..999

# create range for those multiples of 3 or 5
ext_range = []

# for each member of the range check if its a multiple of 3 or 5, if so push it to the ext_range
range.each { |e| if e % 3 == 0 || e % 5 == 0 then ext_range.push(e) end }

# initialize sum to zero
sum = 0

# iterate over the ext_range and calculate the sum
ext_range.each { |x| sum += x  }

# display sum
puts sum
