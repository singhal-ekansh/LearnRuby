# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class NameException < StandardError
end

class String
  def validate_name(first_name, last_name)
    raise NameException, 'Firstname cannot be blank' if first_name.nil? || first_name.length.zero?
    raise NameException, 'Lastname cannot be blank' if last_name.nil? || last_name.length.zero?
    raise NameException, 'Firstname must start with uppercase letter' if first_name !~ /[A-Z].*/
    
    "Your name is #{first_name} #{last_name}"
  rescue NameException => error
    error
  end
end

first_name, last_name = ARGV
puts String.new.validate_name(first_name,last_name)
    
    