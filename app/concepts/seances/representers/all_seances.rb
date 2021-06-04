module Seances
  module Representers
    class AllSeances
      attr_reader :seances

      def initialize(seances)
        @seances= seances
      end

      def basic
        seances.map do |seance|
          {
            id: seance.id,
            start_time: seance.start_time,
          }
        end
      end
    end
  end
end

