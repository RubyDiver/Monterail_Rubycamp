# frozen_string_literal: true

module Tickets
  class Repository
    attr_reader :adapter

    def initialize(adapter: Ticket)
      @adapter = adapter
    end

    def find_all
      adapter.order(:id).all
    end

    def find(id)
      adapter.find(id)
    end

    def create(params)
      adapter.create(params)
    end

    def update(id, params)
      adapter.update(id, params)
    end

    def delete(id)
      adapter.destroy(id)
    end

    def create!(params)
      adapter.create!(params)
    end
  end
end
