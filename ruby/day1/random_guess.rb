random_number = rand(10)

puts 'Enter your guess between 0 and 9: '
guess = gets.to_i

while guess != random_number
  puts 'Oops, not quite, guess again: '
  guess = gets.to_i
end

puts "You guessed it!  The number was #{random_number}"
