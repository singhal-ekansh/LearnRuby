# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Product
  attr_accessor :name, :imported, :tax_exempted, :price, :price_after_taxes
  TAX_RATE = 10
  DUTY_RATE = 5
  def initialize(name, imported, tax_exempted, price)
    @name = name
    @imported = imported
    @tax_exempted = tax_exempted
    @price = price.to_i
    @price_after_taxes = product_total_price
  end
  
  def product_total_price 
    @price + sales_tax + custom_duty
  end
  
  def is_tax_exempted
    return @tax_exempted.eql? 'yes'
  end
  
  def is_imported
    return @imported.eql? 'yes'
  end
  
  def sales_tax
    is_tax_exempted ? 0 : (@price * TAX_RATE / 100.0)
  end
  
  def custom_duty
    is_imported ? (@price * DUTY_RATE / 100.0) : 0
  end
end

#generating invoice 
class BillGenerater
  Questions = ['Name of the product: ', 'Imported?: ', 'Exempted from sales tax?: ', 'Price: ']
  def initialize
    @product_list = []
    @total_amount = 0
  end

  def take_input
    new_item_detail = []
    Questions.each do |question|
      print question
      new_item_detail << gets.chomp
    end
    Product.new(*new_item_detail)
  end

  def add_items
    choice = 'y'
    while choice.eql? 'y'
      new_product = take_input
      @product_list << new_product
      print 'Do you want to add more items to your list(y/n): '
      choice = gets.chomp
    end
    show_invoice
  end

  def grand_total
    @product_list.each do |item|
      @total_amount += item.price_after_taxes
    end
    @total_amount
  end

  def show_invoice
    puts "Product name \t Imported \t Tax_exempted \t  Price \t Price_after_taxes"
    @product_list.each { |item| puts "#{item.name} \t\t #{item.imported} \t\t #{item.tax_exempted} \t\t #{item.price} \t\t#{item.price_after_taxes} " }
    puts "Total Amount = #{grand_total.round(0).to_i}"
  end
end

BillGenerater.new.add_items