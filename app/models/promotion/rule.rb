# frozen_string_literal: true

class Promotion::Rule < BaseModel
  attr_reader :promotable_type, :promotable, :condition_type, :condition_value
end
