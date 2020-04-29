# frozen_string_literal: true

class CheckoutService
  attr_reader :cart, :available_promotions

  def initialize(available_promotions)
    @available_promotions = available_promotions
  end

  def scan(product_code)
    add_to_cart(product_code)
  end

  def total(calculator_class = Checkout::Calculator)
    calculator = calculator_class.new(cart, available_promotions)
    calculator.call
    calculator.total
  end

  private

  def add_to_cart(product_code)
    if existing_item = cart.items.select { |item| item.product_code == product_code }.first
      existing_item.amount += 1
    else
      cart.items << Checkout::Item.new(product_code: product_code, amount: 1)
    end
  end

  def cart
    @cart ||= Checkout::Cart.new(items: [])
  end
end
