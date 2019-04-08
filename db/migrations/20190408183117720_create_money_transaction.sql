-- +micrate Up
CREATE TABLE money_transactions (
  id BIGSERIAL PRIMARY KEY,
  from_id BIGINT,
  to_id BIGINT,
  event_id BIGINT,
  amount INT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX money_transaction_from_id_idx ON money_transactions (from_id);
CREATE INDEX money_transaction_to_id_idx ON money_transactions (to_id);
CREATE INDEX money_transaction_event_id_idx ON money_transactions (event_id);

-- +micrate Down
DROP TABLE IF EXISTS money_transactions;
