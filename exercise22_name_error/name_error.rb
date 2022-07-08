# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class FirstNameException < StandardError
end
class LastNameException < StandardError
end
class CapitalizeException < StandardError
end

class UserValidation
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end
  
  def validate_name
    raise FirstNameException, 'Firstname cannot be blank' if @first_name.to_s.empty?
    raise LastNameException, 'Lastname cannot be blank' if @last_name.to_s.empty?
    raise CapitalizeException, 'Firstname must start with uppercase letter' if @first_name !~ /[A-Z].*/

    "Your name is #{@first_name} #{@last_name}"
    
  rescue FirstNameException, LastNameException, CapitalizeException => e
    e
  end
end

first_name, last_name = ARGV
puts UserValidation.new(first_name, last_name).validate_name