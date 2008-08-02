# lib/pinto/type/claimed_id.rb

module Pinto
  module Type
    class ClaimedID
      def initialize(claimed_id)
        unless claimed_id.is_a? String
          raise ArgumentError.new('claimed_id must be String')
        end

        @claimed_id = claimed_id
      end

      def to_s
        return @claimed_id
      end
    end
  end
end
