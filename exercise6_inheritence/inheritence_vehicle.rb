class Vehicle
  def initialize(name, price)
    @name = name
    @price = price
  end
  
  def to_s
    puts "Bike Name: #{@name}"
    puts "Bike Price: #{@price}"
  end
end

class Bike < Vehicle
  attr_accessor :percent_price_increase, :one_percent_hike
  def initialize(bike_name,bike_price,dealer_name, percent_price_increase)
    super(bike_name,bike_price)
    @dealer = dealer_name
    @percent_price_increase = percent_price_increase
    @one_percent_hike = 0.01
  end

  def price_increase
    @price += (@price * @percent_price_increase * @one_percent_hike)
  end

  def to_s
    print super.to_s
    puts "Dealer Name: #{@dealer}"
  end  
end

bike_obj = Bike.new('BajajDiscover', 58000, 'BaggaLink', 12)
bike_obj.to_s
bike_obj.price_increase
puts "After #{bike_obj.percent_price_increase} hike in price:"
bike_obj.to_s

  
  