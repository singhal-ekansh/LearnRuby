class Account 
  attr_accessor :name , :account_no , :balance
  @@account_number_latest = 0
  
  def initialize (name,balance)
    @@account_number_latest += 1
    @name = name
    @balance = balance
    @account_no = @@account_number_latest
  end
  
  def deposit (amount)
    @balance += amount
    display_account_info
  end
  
  def withdraw (amount)
    @balance -= amount
    display_account_info
  end 
  
  def display_account_info
    puts "Account number: #{@account_no}"
    puts "Account holder: #{@name}"
    puts "Account balance: #{@balance}"
  end  
end

account_one = Account.new("Rahul",2000)
account_two = Account.new("Abhishek",3000)
account_one.withdraw(200)
puts
account_two.deposit(200)
puts account_one.to_s

  