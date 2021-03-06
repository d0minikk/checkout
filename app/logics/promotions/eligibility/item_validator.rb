# frozen_string_literal: true

module Promotions
  module Eligibility
    class ItemValidator
      def initialize(available_promotions)
        @available_promotions = available_promotions
      end

      def eligible?(promotion, promotable, total:)
        case promotion.rule.condition_type
        when 'count_is_more_than'
          promotable.amount > promotion.rule.condition_value
        end
      end
    end

    private

    attr_reader :available_promotions
  end
end
