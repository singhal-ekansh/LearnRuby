class Interest
  RATE = 0.1
  attr_accessor :principle, :time
  def initialize
    yield self
  end

  def simple_interest
    @principle + @principle * RATE * @time 
  end

  def compound_interest
    @principle * ((1 + RATE)**@time)
  end
  
end

i = Interest.new do |object|
  object.principle = 1500
  object.time = 2
end 
puts (i.compound_interest - i.simple_interest ).round(2)