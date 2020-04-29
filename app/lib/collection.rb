# frozen_string_literal: true

module Collection
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    @@collection = {}

    def all
      @@collection[self.to_s] = [] if @@collection[self.to_s].nil?
      @@collection[self.to_s]
    end

    def find(id)
      self.all.select { |p| p.id == id }.first
    end
  end

  def initialize(args={})
    super(args)
    self.class.all << self
  end
end
