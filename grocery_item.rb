class GroceryItem
  attr_accessor :item_name, :item_quantity, :item_before_discount, :item_after_discount
  def initialize(item_name, item_quantity)
    @item_details = {
      "milk" => {
        "item_price" => 3.97,
        "offer_price" => 2.5
      },
      "bread" => {
        "item_price" => 2.17,
        "offer_price" => 2.0
      },
      "apple" => {
        "item_price" => 0.89
      },
      "banana" => {
        "item_price" => 0.99
      }
    }
    @item_name = item_name
    @item_quantity = item_quantity
    @item_before_discount = cal_item_before_discount
    @item_after_discount = cal_item_after_discount
  end
end