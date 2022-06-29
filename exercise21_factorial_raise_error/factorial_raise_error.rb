# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class NegativeException < StandardError
  def initialize(msg)
    super
  end
end

class Integer
  def factorial
    begin
    raise NegativeException, "Negative number entered" if self.negative?
    (1..self).inject(1,:*)
    rescue NegativeException => e
      return e
    end
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  puts ARGV[0].to_i.factorial
end