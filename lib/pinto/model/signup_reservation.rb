module Pinto
  module Model
    class SignupReservation
      def self.add(claimed_id)
        db_config = Pinto::Config::DB.load
        begin
          dsn = 'dbi:Mysql:%s:%s' % [db_config.name, db_config.host]
          dbh = DBI.connect(dsn, db_config.user, db_config.password)
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
