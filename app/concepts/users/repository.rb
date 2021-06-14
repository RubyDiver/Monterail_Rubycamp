# frozen_string_literal: true

module Users
  class Repository
    attr_reader :adapter

    def initialize(adapter: User)
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

    def offline_user
      adapter.where(real_user: false).first
    end
  end
end
