class String
  def is_palindrome?
    input_length = self.length
    for index in 0..Integer(input_length/2)
      return false if self[index] != self[input_length-index-1]
    end
    true
  end
end  

input = gets.chomp

if input.length.zero? 
  puts 'Please provide an input'
elsif input.is_palindrome?
  puts 'Input string is a palindrome'
else
  puts 'Input string is not a palindrome'  
end
