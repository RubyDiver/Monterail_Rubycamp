# frozen_string_literal: true

module Seances
  class Repository
    attr_reader :adapter

    def initialize(adapter: Seance)
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

    def available_seats(seance)
      all_seats = seance.cinema_hall.seats.flatten
      taken_seats = taken_seats(seance)

      all_seats - taken_seats
    end

    def taken_seats(seance)
      byebug
      sold_seats = seance.reservations.includes(:tickets).flat_map(&:tickets).map(&:seat)
      not_available = seance.cinema_hall.not_available

      sold_seats + not_available
    end
  end
end
