PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

INSERT OR REPLACE INTO photometer_t(model, serial_number) VALUES("SQM_L","123456");
INSERT OR REPLACE INTO photometer_owner_t(photometer_id, observer_id) VALUES (
	(SELECT last_insert_rowid()),
	(SELECT observer_id   FROM observer_t   WHERE name  = 'Fernando' AND surname = 'Jáuregui')
);

INSERT OR REPLACE INTO photometer_t(model, serial_number) VALUES("SQM_L","672234");
INSERT OR REPLACE INTO photometer_owner_t(photometer_id, observer_id) VALUES (
	(SELECT last_insert_rowid()),
	(SELECT observer_id   FROM observer_t   WHERE name  = 'Jordi' AND surname = 'Medina')
);

INSERT OR REPLACE INTO photometer_t(model, serial_number,tag) VALUES("SQM_L","345677","SEA#08");
INSERT OR REPLACE INTO photometer_owner_t(photometer_id, observer_id) VALUES (
	(SELECT last_insert_rowid()),
	(SELECT observer_id   FROM observer_t   WHERE name  = 'Manolo' AND surname = 'Barco')
);

COMMIT;
