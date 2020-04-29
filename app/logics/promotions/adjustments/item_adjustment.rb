# frozen_string_literal: true

module Promotions
  module Adjustments
    class ItemAdjustment < Promotions::Adjustments::Base
      def calculate
        adjustable.price_cents.send(operation_type, action.discount_value)
      end
    end
  end
end
