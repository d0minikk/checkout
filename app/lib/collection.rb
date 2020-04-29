# frozen_string_literal: true

module Collection
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    @@collections = {}

    def all
      @@collections[self.to_s] = [] if @@collections[self.to_s].nil?
      @@collections[self.to_s]
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
