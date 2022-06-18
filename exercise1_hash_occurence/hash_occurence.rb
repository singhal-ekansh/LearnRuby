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
    print frequency_table
  end
end
  
puts 'Please provide an input'
input = gets.chomp
print input.hash_occurences
  