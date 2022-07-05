# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Array
  def reverse_iterate(&block)
    return if empty?
    
    yield pop
    reverse_iterate(&block)
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  ARGV[0][1..-1].split(',').map {|ele| ele.strip.gsub(/'/,'')}.reverse_iterate {|i| print "#{i} "}
end