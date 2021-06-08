# frozen_string_literal: true

module Seances
  module Representers
    class OneSeance
      attr_reader :seance

      def initialize(seance)
        @seance = seance
      end

      def basic
        {
          id: seance.id,
          start: seance.start_time
        }
      end
    end
  end
end
