-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
ALTER TABLE user_events
  ADD COLUMN is_admin BOOL;

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
ALTER TABLE user_events
  DROP COLUMN is_admin;
