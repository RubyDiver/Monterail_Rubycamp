# frozen_string_literal: true

module Reservations
  class Repository
    attr_reader :adapter

    ReservationInvalidError = Class.new(StandardError)

    def initialize(adapter: Reservation)
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
    rescue ActiveRecord::RecordInvalid
      raise ReservationInvalidError, "Couldn't create reservation"
    end
  end
end
