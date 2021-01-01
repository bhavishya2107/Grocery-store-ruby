require_relative './grocery_item.rb'
require 'terminal-table'

$table_data = []
$items_price_after_discount = []
$items_price = []
$items_added = []

def user_input 
  puts "Please enter items seperated by a comma"
  user_input = gets.chomp.split(",")
  add_items("milk") if $items_added.include?("milk")
  add_items("bread") if $items_added.include?("bread")
  add_items("apple") if $items_added.include?("apple")
  add_items("banana") if $items_added.include?("banana")
end

def add_items(item_name)
  item_quantity  = $items_added.count(item_name)
  single_item = GroceryItem.new(item_name, item_quantity)
  $table_data << [single_item.item_name.capatalize(), single_item.item_quantity, "$#{single_item.item_after_discount}"]
  $items_price_after_discount << single_item.item_after_discount
  $items_price << single_item.item_before_discount
end

