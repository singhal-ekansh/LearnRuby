class Integer
  def factorial
    (1..self).inject(1,:*)
  end
end

p 2.to_i.factorial