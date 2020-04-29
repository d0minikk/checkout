# frozen_string_literal: true

class Checkout::Item < BaseModel
  attr_reader :product_code, :amount
end
