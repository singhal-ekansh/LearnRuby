class Fibonacci
  def print_fibonacci_series (limit_value)
    last_number , second_last_number = 1 , 1
    print last_number
    while last_number <= limit_value
      sum_last_two_numbers = last_number + second_last_number
      yield (last_number)
      second_last_number = last_number
      last_number = sum_last_two_numbers
    end
  end
end

series_limit = gets.chomp
if series_limit.length.zero?
  puts "Please provide an input"
else
  Fibonacci.new.print_fibonacci_series(series_limit.to_i) {|number| print " #{number}"}
end  