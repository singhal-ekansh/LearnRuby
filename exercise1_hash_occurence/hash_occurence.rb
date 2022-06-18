# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
class String
    def hash_occurences
      # defining an empty hash with default as 0
      frequency_table = Hash.new(0)
    
      # check if character is alphabet and increase count
      self.each_char do |character|
        if character =~ /[[:alpha:]]/
          frequency_table[character] += 1
        end
      end
    frequency_table
    end
end
    
input = gets.chomp
if input.length == 0 
  puts 'Please provide an input'
else
  print input.hash_occurences
end  
    