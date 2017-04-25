DROP TABLE IF EXISTS bounties;

CREATE TABLE bounties (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty_value INT2,
  danger_level VARCHAR(255),
  last_known_location VARCHAR(255),
  home_world VARCHAR(255),
  favourite_weapon VARCHAR(255),
  cashed_in  VARCHAR(255),
  collected_by INT2
);

INSERT INTO bounties 
(name, species, bounty_value, danger_level, last_known_location, home_world, favourite_weapon, cashed_in, collected_by)
VALUES
( 'Dave', 'space_rhino', 100, 'low', 'earth', 'mars', 'mace', 'false', 0);
