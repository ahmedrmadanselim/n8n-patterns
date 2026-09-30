CREATE TABLE IF NOT EXISTS error_alerts (
  fingerprint TEXT PRIMARY KEY,
  last_sent   TIMESTAMPTZ NOT NULL DEFAULT now(),
  hits        INT NOT NULL DEFAULT 1
);
