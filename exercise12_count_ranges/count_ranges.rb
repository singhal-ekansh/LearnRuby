# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class String

  def count_ranges
    @freq_map = Hash.new {|h,k| h[k]=0}
    each_char do |character|
      case character
      when ('a'..'z')
        @freq_map['lower'] += 1
      when ('A'..'Z')
        @freq_map['upper'] += 1
      when ('0'..'9')
        @freq_map['digits'] += 1
      else
        @freq_map['special'] += 1
      end
    end
  end
  
  def to_s
    str = ""
    str += "Lowercase characters = #{@freq_map['lower']}\n"
    str += "Uppercase characters = #{@freq_map['upper']}\n"
    str += "Numeric characters = #{@freq_map['digits']}\n"
    str += "Special characters = #{@freq_map['special']}"
    str
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  puts ARGV[0].dup.count_ranges.to_s
end