# frozen_string_literal: true

module Checkout
  class Item < BaseModel
    attr_accessor :product_code, :amount, :price_cents, :price_currency
  end
end
