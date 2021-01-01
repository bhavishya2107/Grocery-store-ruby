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

  def cal_item_before_discount
    return @item_details[@item_name]["item_price"] * @item_quantity
  end

  def cal_item_after_discount
    case @item_name
    when "milk"
      offer_on_item_quantity = 2
      final_price = apply_discount(@item_details["milk"]["item_price"], @item_details["milk"]["offer_price"], offer_on_item_quantity)
      return final_price
    when "bread"
      offer_on_item_quantity = 3
      final_price = apply_discount(@item_details["bread"]["item_price"], @item_details["bread"]["offer_price"], offer_on_item_quantity)
      return final_price
    when "apple"
      return @item_details["apple"]["item_price"] * @item_quantity
    when "banana"
      return @item_details["banana"]["item_price"] * @item_quantity
    end
  end

  def apply_discount(item_price, offer_price, offer_on_item_quantity)
    item_after_discount = 0
    if @item_quantity < offer_on_item_quantity
      item_after_discount = item_price * @item_quantity
      return item_after_discount
    end
    if @item_quantity >= offer_on_item_quantity
      item_after_discount = ((offer_price * offer_on_item_quantity) * (@item_quantity / offer_on_item_quantity) ) + (item_price * (@item_quantity % offer_on_item_quantity))
      return item_price_after_discount
    end
  end

end