# frozen_string_literal: true

class Product < BaseModel
  include Collection

  attr_reader :id, :name, :price_cents, :price_currency

  alias_method :currency, :price_currency

  def price
    price_cents * 100
  end
end
