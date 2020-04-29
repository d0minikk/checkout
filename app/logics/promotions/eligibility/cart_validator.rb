# frozen_string_literal: true

module Promotions
  module Eligibility
    class CartValidator
      def initialize(available_promotions)
        @available_promotions = available_promotions
      end

      def eligible?(promotion, promotable, total:)
        case promotion.rule.condition_type
        when 'total_is_more_than'
          total > promotion.rule.condition_value
        end
      end
    end

    private

    attr_reader :available_promotions
  end
end
