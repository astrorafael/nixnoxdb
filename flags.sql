PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

-- Observador principal
INSERT OR REPLACE INTO flags_t(timestamp_method) VALUES("Start & end timestamp, equal interpolated timestamp readings");

COMMIT;
-- Possible values are:
-- 0 = Individual timepstamp readings
-- 1 = Start timestamp given, forward readings interpolation assuming 5 minutes each
-- 2 = End timestamp given, backwards readings interpolation assuming 5 minutes each
-- 3 = Start & end timestamp, equal interpolated timestamp readings
