# frozen_string_literal: true

module Checkout
  class Cart < BaseModel
    attr_reader :items, :promotion_actions
  end
end
