# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Product
  TAX_RATE = 10
  DUTY_RATE = 5
  attr_accessor :name, :imported, :tax_exempted, :price
  def initialize(name, imported, tax_exempted, price)
    @name = name
    @imported = imported
    @tax_exempted = tax_exempted
    @price = price.to_i
  end

  def product_total_price
    @price + sales_tax + custom_duty
  end

  def tax_exempted?
    @tax_exempted == 'yes'
  end

  def imported?
    @imported == 'yes'
  end

  def sales_tax
    tax_exempted? ? 0 : (@price * TAX_RATE / 100.0)
  end

  def custom_duty
    imported? ? (@price * DUTY_RATE / 100.0) : 0
  end
end

# generating invoice
class BillGenerater
  QUESTIONS = ['Name of the product: ', 'Imported?: ', 'Exempted from sales tax?: ', 'Price: '].freeze
  def initialize
    @product_list = []
    @total_amount = 0
  end

  def take_input
    new_item_detail = []
    QUESTIONS.each do |question|
      print question
      new_item_detail << gets.chomp
    end
    Product.new(*new_item_detail)
  end

  def add_items
    choice = 'y'
    while choice.eql? 'y'
      @product_list << take_input
      print 'Do you want to add more items to your list(y/n): '
      choice = gets.chomp
    end
  end

  def grand_total
    @total_amount = @product_list.sum(&:product_total_price)
  end

  def show_invoice
    puts "Product name \t Imported \t Tax_exempted \t  Price \t Price_after_taxes"
    @product_list.each { |item| puts "#{item.name} \t\t #{item.imported} \t\t #{item.tax_exempted} \t\t #{item.price} \t\t#{item.product_total_price} " }
    puts "Total Amount = #{grand_total.round(0).to_i}"
  end
end

new_invoice = BillGenerater.new
new_invoice.add_items
new_invoice.show_invoice