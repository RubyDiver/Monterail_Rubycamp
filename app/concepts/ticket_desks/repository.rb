# frozen_string_literal: true

module TicketDesks
  class Repository
    attr_reader :adapter

    def initialize(adapter: TicketDesk)
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

    def online
      adapter.where(online: true).first
    end
  end
end
