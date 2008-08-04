# lib/pinto/model/signup_reservation.rb

module Pinto
  module Model
    class SignupReservation
      def self.add(claimed_id)
        unless claimed_id.is_a? Pinto::Type::ClaimedID
          raise ArgumentError.new('claimed_id must be Pinto::Type::ClaimedID')
        end

        db_config = Pinto::Config::DB.load

        begin
          dsn = 'dbi:Mysql:%s:%s' % [db_config.name.to_s, db_config.host.to_s]
          dbh = DBI.connect(dsn,
                            db_config.user.to_s,
                            db_config.password.to_s)
          dbh.do('INSERT INTO signup_reservations (claimed_id, reserved_at) ' +
                 'VALUES (?, NOW()) ' +
                 'ON DUPLICATE KEY UPDATE reserved_at = NOW()',
                 claimed_id.to_s)
        ensure
          dbh.disconnect if dbh
        end
      end
    end
  end
end
