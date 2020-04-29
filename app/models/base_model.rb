# frozen_string_literal: true

class BaseModel
  def initialize(args={})
    args.each do |name, value|
      instance_variable_set("@#{name}", value)
    end
  end
end
