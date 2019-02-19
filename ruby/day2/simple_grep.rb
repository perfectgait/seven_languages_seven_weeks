puts 'Enter the phrase to search for: '

phrase = gets.to_s.strip
file = File.new 'simple_grep.txt'

file.each { |line| puts "#{file.lineno}: #{line}" if line.downcase.include? phrase.downcase }
