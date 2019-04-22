-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
ALTER TABLE events
  ADD COLUMN name VARCHAR;

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
ALTER TABLE events
  DROP COLUMN name;
