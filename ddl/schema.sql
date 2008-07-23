DROP TABLE IF EXISTS signup_reservations;
CREATE TABLE signup_reservations (
  claimed_id VARCHAR(255) NOT NULL,
  reserved_at DATETIME NOT NULL,
  PRIMARY KEY (claimed_id)
)
ENGINE=InnoDB;
