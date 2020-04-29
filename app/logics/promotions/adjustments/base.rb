# frozen_string_literal: true

module Promotions
  module Adjustments
    class Base
      def initialize(adjustable, action, total: nil)
        @adjustable = adjustable
        @action = action
        @total = total
      end

      def calculate
      end

      private

      attr_reader :adjustable, :action, :total

      def operation_type
        if action.discount_value_type == 'percent'
          '*'
        elsif action.discount_value_type == 'price'
          '-'
        end
      end
    end
  end
end
