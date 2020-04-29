# frozen_string_literal: true

module Collection
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    @@collection = []
    @@last_id = 0

    def all
      @@collection
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
