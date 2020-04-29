# frozen_string_literal: true

class Checkout::Cart < BaseModel
  attr_reader :items, :promotion_actions
end
