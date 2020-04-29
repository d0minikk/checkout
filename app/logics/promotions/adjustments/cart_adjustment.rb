# frozen_string_literal: true

module Promotions
  module Adjustments
    class CartAdjustment < Promotions::Adjustments::Base
      def calculate
        total.send(operation_type, action.discount_value)
      end
    end
  end
end
