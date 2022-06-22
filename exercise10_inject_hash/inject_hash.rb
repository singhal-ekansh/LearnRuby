class Array
  def hash_by_len
    count_by_length = Hash.new { |hash, key| hash[key] = [] }
    each { |item| count_by_length[item.length].push(item) }
    return count_by_length
  end

  def hash_odd_even
    frequency_hash = self.hash_by_len
    return frequency_hash.inject(Hash.new {|h,k| h[k] = [] }) do |odd_even, item|
      odd_even[item[0].odd? ? "odd" : "even"] << item[1]
      odd_even
    end
  end
end

print ['abc','def',"1234","234",'abcd','x','mnop',"5",'zZzZ'].hash_odd_even