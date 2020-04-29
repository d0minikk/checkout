# frozen_string_literal: true

class Seeds
  def call
    generate_products
    generate_promotions
  end

  private

  def generate_products
    products_hash.each { |params| Product.new(*params) }
  end

  def products_hash
    [
      { id: '001', name: 'Red Scarf', price_cents: 925, price_currency: 'GBP' }
      { id: '002', name: 'Silver cufflinks', price_cents: 4500, price_currency: 'GBP' }
      { id: '003', name: 'Silk Dress', price_cents: 1995, price_currency: 'GBP' }
    ]
  end

  def generate_promotions
    action1 = Promotion::Action.new(
      discount_value: 10,
      discount_value_type: 'percent'
    )

    action2 = Promotion::Action.new(
      discount_value: 0.75,
      discount_value_type: 'price'
    )

    rule1 = Promotion::Rule.new(
      promotable_type: 'order',
      condition_type: 'total_is_more_than',
      condition_value: 60,
    )

    rule2 = Promotion::Rule.new(
      promotable_type: 'item',
      promotable: Product.find('001'),
      condition_type: 'count_is_more_than',
      condition_value: 1,
    )

    promotion1 = Promotion.new(
      name: '10% off',
      rule: rule1,
      action: action1,
    )

    promotion2 = Promotion.new(
      name: 'Red scarf promotion',
      rule: rule2,
      action: action2,
    )
  end
end
