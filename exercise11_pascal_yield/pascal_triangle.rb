# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Integer
  def factorial
    self.zero? ? (1) : ((1..self).inject(:*))
  end
  
end

class PascalGenerator
  attr_accessor :num_of_lines
  def initialize(lines)
    num_of_lines = lines
  end
  
  def combination(row,col)
    (row.factorial) / ((col.factorial) * ((row - col).factorial))
  end

  def generate
    series = []
    
    (0...num_of_lines).each do |row|
      row_entry = []
      (0..row).each { |col| row_entry.push(combination(row,col)) }
      series.push(row_entry)
      
    end
    yield series if block_given?
  end
  
end

if ARGV.length.zero?
  print 'Please provide an input'
else
  PascalGenerator.new(ARGV[0].to_i).generate do |series|
    series.each do |line|
      line.each { |num| print "#{num} " }
      puts
    end
  end
end