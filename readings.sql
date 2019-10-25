BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS readings_t
	(
		date_id             INTEGER NOT NULL REFERENCES date_t(date_id), 
		time_id             INTEGER NOT NULL REFERENCES time_t(time_id), 
		photom_id           INTEGER NOT NULL REFERENCES photometer_t(photom_id),
		location_id         INTEGER NOT NULL REFERENCES location_t(location_id),
		observer_id         INTEGER NOT NULL REFERENCES observer_t(observer_id),
		observation_id      INTEGER NOT NULL REFERENCES observation_t(observation_id),
		flags_id            INTEGER NOT NULL REFERENCES flags_t(flags_id),
		azimuth             REAL,
		altitude            REAL,
		magnitude           REAL,
		PRIMARY KEY (date_id, time_id, photom_id, location_id, observer_id)
	);
COMMIT;