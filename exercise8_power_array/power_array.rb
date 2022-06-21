class Array
  def power(x)
    map{|item| item**x}
  end
end

print [2,5,8].power(2)
