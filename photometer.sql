PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

INSERT OR REPLACE INTO photometer_t(model, serial_number) VALUES("SQM_L","123456");

INSERT OR REPLACE INTO photometer_owner_t(photometer_id, observer_id) VALUES (
	(SELECT photometer_id FROM photometer_t WHERE model = 'SQM_L'    AND serial_number = '123456'),
	(SELECT observer_id   FROM observer_t   WHERE name  = 'Fernando' AND surname = 'Jáuregui')
);
COMMIT;
