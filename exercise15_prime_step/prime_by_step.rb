class Integer
  def prime
    start = 2
    primes = []
    start.step(self,1) do |number|
      divisor = 0
      start.step(Math.sqrt(number),1) {|div| divisor +=1 if number%div == 0}
      primes << number if divisor == 0
    end
    primes
  end
end

print 20.prime 