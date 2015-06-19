class CartItem < ActiveRecord::Base
  belongs_to :food
  belongs_to :cart
  validates :quantity, presence: true, numericality: { only_float: true, greater_than: 0 }




private
  def food_present
    if food.nil?
      errors.add(:food, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:cart, "is not a valid order.")
    end
  end


end
