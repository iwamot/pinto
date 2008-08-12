module Pinto
  class OpenID
    class ClaimedID
      def initialize(claimed_id)
        @claimed_id = claimed_id.to_s
      end

      def to_s
        return @claimed_id
      end
    end
  end
end
