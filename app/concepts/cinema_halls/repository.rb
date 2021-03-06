# frozen_string_literal: true

module CinemaHalls
  class Repository
    def initialize(adapter: CinemaHall)
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

    private

    attr_reader :adapter
  end
end
