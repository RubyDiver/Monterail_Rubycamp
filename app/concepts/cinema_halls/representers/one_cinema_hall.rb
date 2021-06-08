# frozen_string_literal: true

module CinemaHalls
  module Representers
    class OneCinemaHall
      attr_reader :cinema_hall

      def initialize(cinema_hall)
        @cinema_hall = cinema_hall
      end

      def basic
        {
          id: cinema_hall.id,
          name: cinema_hall.hall_name,
          volume: cinema_hall.volume
        }
      end
    end
  end
end
