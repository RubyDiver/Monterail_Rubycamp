# frozen_string_literal: true

module Movies
  class Repository
    attr_reader :adapter

    def initialize(adapter: Movie)
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
  end
end
