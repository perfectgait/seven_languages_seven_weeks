array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]

puts 'Printing the contents of the array, 4 elements at a time using each'
array[0..3].each { |element| puts "Value: #{element}" }
array[4..7].each { |element| puts "Value: #{element}" }
array[8..11].each { |element| puts "Value: #{element}" }
array[12..15].each { |element| puts "Value: #{element}" }

puts 'Printing the contents of the array, 4 elements at a time using each_slice'
array.each_slice(4) { |slice| slice.each { |value| puts "Value #{value}" } }
