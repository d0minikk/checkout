# frozen_string_literal: true

module Promotions
  class Rule < BaseModel
    attr_reader :promotable_type, :promotable, :condition_type, :condition_value
  end
end
