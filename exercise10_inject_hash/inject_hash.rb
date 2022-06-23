class Array
  def hash_odd_even
    self.group_by(&:length)
    odd_even_hash = inject(Hash.new {|h,k| h[k] = [] }) do |odd_even, item|
      odd_even[item[0].to_i.odd? ? "odd" : "even"] << item[1]
      odd_even
    end 
  end
end

print ['abc','def',"1234","234",'abcd','x','mnop',"5",'zZzZ'].hash_odd_even