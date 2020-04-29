# frozen_string_literal: true

module Promotions
  module Eligibility
    class Validator
      def initialize(available_promotions)
        @available_promotions = available_promotions
      end

      def eligible?(promotion, promotable, total: nil)
        validator(promotable).eligible?(promotion, promotable, total: total)
      end

      private

      attr_reader :available_promotions

      def validator(promotable)
        klass = if promotable.is_a?(Checkout::Item)
          Promotions::Eligibility::ItemValidator
        elsif promotable.is_a?(Checkout::Cart)
          Promotions::Eligibility::CartValidator
        end

        klass.new(available_promotions)
      end
    end
  end
end
