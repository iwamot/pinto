# lib/pinto/model/signup_reservation.rb

module Pinto
  module Model
    class SignupReservation
      def self.add(claimed_id)
        db_info = Pinto::Config.db

        begin
          dsn = 'dbi:Mysql:%s:%s' % [db_info['name'], db_info['host']]
          dbh = DBI.connect(dsn, db_info['user'], db_info['password'])
          dbh.do('INSERT INTO signup_reservations (claimed_id, reserved_at) ' +
                 'VALUES (?, NOW()) ' +
                 'ON DUPLICATE KEY UPDATE reserved_at = NOW()',
                 claimed_id)
        ensure
          dbh.disconnect if dbh
        end
      end
    end
  end
end
