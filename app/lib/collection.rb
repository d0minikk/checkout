# frozen_string_literal: true

module Collection
  included do
    @@collection = []
    @@last_id = 0

    def self.all
      @@collection
    end

    def self.find(id)
      self.all.select { |p| p.id == id }.first
    end

    def initialize(args)
      self.class.all << self
    end
  end
end
