class String
  def count_ranges
    freq_map = Hash.new(0)
    each_char do |character|
      case character
      when 'a'..'z'
        freq_map['lower'] += 1
      when 'A'..'Z'
        freq_map['upper'] += 1
      when '0'..'9'
        freq_map['digits'] += 1
      else
        freq_map['special'] += 1
      end
    end
    yield freq_map
  end   
end

'1234aaaaDaDDDA)))###'.count_ranges do |map|
  puts "Lowercase characters = #{map['lower']}"
  puts "Uppercase characters = #{map['upper']}"
  puts "Numeric characters = #{map['digits']}"
  puts "Special characters = #{map['special']}"
end
    
