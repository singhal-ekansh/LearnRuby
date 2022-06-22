class Pascal
  def pascal_print (num_of_lines)
    puts '1'
    prev_line = []
    (num_of_lines-1).times do
      yield prev_line
      prev_line.push(1)
      prev_line.unshift(1)
      next_line = prev_line.each_cons(2).to_a.map{ |element| element.inject(:+)}
      prev_line = next_line
    end  
  end
end

Pascal.new.pascal_print(3) do |line|
  print "1 "
  line.to_a.each {|num| print "#{num} "}
  puts '1'
end  


