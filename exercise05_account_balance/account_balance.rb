# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Account
  attr_accessor :name, :account_no, :balance
  @@account_number_latest = 0
  def initialize(name, balance)
    increment_accounts_count
    @name = name
    @balance = balance
    @account_no = @@account_number_latest
  end
  
  def increment_accounts_count
    @@account_number_latest += 1
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
  
end

class Transaction
  def initialize(account_one,account_two)
    @account_one = account_one
    @account_two = account_two
  end
  
  
  def transfer(amount)
    @account_one.withdraw(amount)
    @account_two.deposit(amount)
  end
    
    
  def show_accounts_info
    details = ''
    details += "Account number: #{@account_one.account_no}\n"
    details += "Account holder name: #{@account_one.name}\n"
    details += "Account balance: #{@account_one.balance}\n\n"
    details += "Account number: #{@account_two.account_no}\n"
    details += "Account holder name: #{@account_two.name}\n"
    details += "Account balance: #{@account_two.balance}"
  end
end


  account_one = Account.new("Rahul",2000)
  account_two = Account.new("Abhishek",3000)
  transaction = Transaction.new(account_one,account_two)
  transaction.transfer(500)
  puts transaction.show_accounts_info


  