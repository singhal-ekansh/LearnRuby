# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class SalesTax
  def initialize
    @items_data = []
    @total_amount = 0
  end

  def take_input(questions)
    new_item_detail = []
    questions.each do |question|
      print question
      new_item_detail << gets.chomp
    end
    new_item_detail
  end

  def add_items
    choice = 'y'
    while choice == 'y'
      questions = ['Name of the product: ', 'Imported?: ', 'Exempted from sales tax?: ', 'Price: ']
      new_detail = take_input(questions)
      @items_data << new_detail
      print 'Do you want to add more items to your list(y/n): '
      choice = gets.chomp
    end
    show_items
  end

  def calculate_total
    @items_data.each do |item|
      price = item[3].to_i
      sale_tax = item[2] == 'no' ? price * 0.1 : 0
      custom_duty = item[1] == 'yes' ? price * 0.05 : 0
      @total_amount += (price + sale_tax + custom_duty)
    end
  end

  def show_items
    calculate_total
    puts "Product name \t   Imported \t Tax_exempted \t   Price"
    @items_data.each { |item| puts "#{item[0]} \t\t #{item[1]} \t\t #{item[2]} \t\t #{item[3]}" }
    puts "Total Amount = #{@total_amount.to_i}"
  end
end

SalesTax.new.add_items