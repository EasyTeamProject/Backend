-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied

ALTER TABLE events
  ADD subject VARCHAR,
  ADD information VARCHAR;

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
