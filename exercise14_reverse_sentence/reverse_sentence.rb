class String
  def reverse
    self.scan(/\S+/).to_a.reverse_each.inject(""){|rev,word| rev += "#{word} "}
  end
end

print "aaa ccc! vvvv".reverse