# frozen_string_literal: true

module Promotions
  class Action < BaseModel
    attr_reader :discount_value, :discount_value_type
  end
end
