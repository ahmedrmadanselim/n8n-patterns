CREATE TABLE IF NOT EXISTS processed_messages (
  message_id  TEXT PRIMARY KEY,
  channel     TEXT NOT NULL,
  seen_at     TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- prune anything older than 30 days on a schedule
DELETE FROM processed_messages WHERE seen_at < now() - INTERVAL '30 days';
