# frozen_string_literal: true

class Promotion < BaseModel
  include Collection

  attr_reader :name, :rule, :action
end
