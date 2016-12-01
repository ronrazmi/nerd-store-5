class Product < ActiveRecord::Base
  has_many :carted_products
  has_many :orders, through: :carted_products


  belongs_to :supplier
  has_many :categorized_products
  has_many :categories, through: :categorized_products

  def discount_message
    if price.to_f < 3
      message = "Discount Item!"
    else
      message = "On Sale!"
    end
    message
  end

  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax
  end

  def style_message
    if price.to_f < 3
      style = "red"
    else
      style = ""
    end
  end

end
