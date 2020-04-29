# frozen_string_literal: true

class Promotion < BaseModel
  include Collection

  attr_reader :id, :name, :rule, :action
end
