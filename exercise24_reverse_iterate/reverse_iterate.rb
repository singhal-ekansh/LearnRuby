class Array
  def reverse_iterate(&block)
    return if empty?

    top = shift
    reverse_iterate(&block)
    yield top
  end
end

[1,2,3,4,5,6].reverse_iterate {|i| print "#{i} "}