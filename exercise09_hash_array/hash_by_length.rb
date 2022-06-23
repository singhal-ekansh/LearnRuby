class Array
  def hash_by_length
    count_by_length = Hash.new([])
    self.each do |item|
      if !count_by_length.key?(item.to_s.length)
        count_by_length[item.to_s.length] = []
      end  
      count_by_length[item.to_s.length].push(item)
    end
    count_by_length
  end    
end

puts ["eee","dd",123,"aaa"].hash_by_length

