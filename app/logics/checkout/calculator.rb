# frozen_string_literal: true

module Checkout
  class Calculator
    attr_reader :total

    def initialize(cart, available_promotions)
      @cart = cart
      @available_promotions = available_promotions
    end

    def call
      calculate_total_adjustment
      calculate_total
    end

    private

    attr_reader :cart, :available_promotions, :items_adjustment, :order_adjustment

    def calculate_total
      @total = total_without_adjustment - total_adjustment
    end

    def total_without_adjustment
      cart.items.map(&:price_cents).sum / 100
    end

    def total_adjustment
      items_adjustment + order_adjustment
    end

    def calculate_total_adjustment
      @items_adjustment = calculate_items_adjustment
      @order_adjustment = calculate_order_adjustment
    end

    def calculate_items_adjustment
      accumulator = 0

      cart.items.map do |item|
        available_promotions.each do |promotion|
          if validator.eligible?(promotion, item)
            Promotions::Adjustments::ItemAdjustment.new(item, promotion.action).calculate
          end
        end
      end

      accumulator
    end

    def calculate_order_adjustment
      accumulator = 0

      available_promotions.each do |promotion|
        if validator.eligible?(promotion, cart, total: items_adjustment)
          Promotions::Adjustments::CartAdjustment.new(cart, promotion.action, total: items_adjustment).calculate
        end
      end

      accumulator
    end

    def validator
      @validator ||= Promotions::Eligibility::Validator.new(available_promotions)
    end
  end
end
