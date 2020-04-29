# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CheckoutService do
  let!(:promotions) { Promotion.all }
  let!(:product_1) { Product.find('001') }
  let!(:product_2) { Product.find('002') }
  let!(:product_3) { Product.find('003') }

  subject { described_class.new(promotions) }

  it 'order is discounted' do
    subject.scan(product_1.id)
    subject.scan(product_2.id)
    subject.scan(product_3.id)

    expect(subject.total).to eq(66.78)
  end

  it 'product is discounted' do
    subject.scan(product_1.id)
    subject.scan(product_3.id)
    subject.scan(product_1.id)

    expect(subject.total).to eq(36.95)
  end

  it 'product and order is discounted' do
    subject.scan(product_1.id)
    subject.scan(product_2.id)
    subject.scan(product_1.id)
    subject.scan(product_3.id)

    expect(subject.total).to eq(73.76)
  end
end
