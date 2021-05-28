module CinemaHalls
  module Representers
    class AllCinemaHalls
      attr_reader :cinema_halls

      def initialize(cinema_halls)
        @cinema_halls = cinema_halls
      end

      def basic
        cinema_halls.map do |cinema_hall|
          {
            id: cinema_hall.id,
            name: cinema_hall.hall_name,
            volume: cinema_hall.volume
          }
        end
      end
    end
  end
end