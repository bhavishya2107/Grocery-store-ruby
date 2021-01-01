require_relative './grocery_item.rb'
require 'terminal-table'

$table_data = []
$items_price_after_discount = []
$items_price = []
$items_added = []

def enter_items
  puts "Please enter all the items purchased separated by a comma"
  $items_added = gets.chomp.split(",")
  add_items("milk") if $items_added.include?("milk")
  add_items("bread") if $items_added.include?("bread")
  add_items("apple") if $items_added.include?("apple")
  add_items("banana") if $items_added.include?("banana")
  display_table 
end

def add_items(item_name)
  item_quantity = $items_added.count(item_name)
  single_item = GroceryItem.new(item_name, item_quantity)
  $table_data << [single_item.item_name.capitalize(), single_item.item_quantity, "$#{single_item.item_after_discount}"]
  $items_price_after_discount.push(single_item.item_after_discount)
  $items_price.push(single_item.item_before_discount)
end

def display_table 
  items_table = Terminal::Table.new :headings => ['Item', 'Quantity', 'Price'], :rows => $table_data
  puts items_table
  show_invoice
end

def show_invoice
  discount_amount = ($items_price.sum - $items_price_after_discount.sum).round(2)
  puts"\n Total price: $#{ $items_price_after_discount.sum} \n You saved $#{discount_amount} today."
end

enter_items
