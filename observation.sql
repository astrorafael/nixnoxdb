PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS observation_t
(
	observation_id   		 INTEGER PRIMARY KEY, 
	photometer_id            INTEGER NOT NULL REFERENCES photometer_t(photometer_id),
	site_id                  INTEGER NOT NULL REFERENCES site_t(site_id),
	observer_id              INTEGER NOT NULL REFERENCES observer_t(observer_id),
	flags_id                 INTEGER NOT NULL REFERENCES flags_t(flags_id),
	start_date_id   		 INTEGER NOT NULL REFERENCES start_date_v(date_id), 
	end_date_id     		 INTEGER NOT NULL REFERENCES end_date_v(date_id), 
	start_time_id   		 INTEGER          REFERENCES start_time_v(time_id), 
	end_time_id      		 INTEGER          REFERENCES end_time_v(time_id), 
	additional_observers_id  INTEGER          REFERENCES group_t(rowid),
	comment          		 TEXT,
	image_url        		 TEXT,	-- Site image as an UTL
	image            		 BLOB,  -- Site image as an embdeed picture
	plot            		 BLOB   -- plot from readings
);
# FECHA	24/03/2012
# HORA INICIO	01:00	# HORA FINAL 	02:41	
INSERT INTO observation_t(start_date_id,start_time_id, end_date_id, end_time_id, 
	        photometer_id, site_id, observer_id, additional_observers_id, flags_id, comment)
VALUES (
	20120124. 010000,
	20120124. 024100,
	(SELECT photometer_id FROM photometer_t WHERE model = "SQM_L" AND serial_number = "123245")
	(SELECT site_id       FROM site_t       WHERE site = "Oservatorio de Guirguillano"),
	(SELECT observer_id   FROM observers_t  WHERE name = "Fernando" AND surname = "Jauregui"),
	(SELECT group_id      FROM groups_t     WHERE group_alias = "Fernando et al.")
	(SELECT flags_id      FROM flags_t      WHERE timestamp_method = "Interpolated by start and end date"),
	"Example comment"
);

COMMIT;

-- Possible values are:
-- 0 = Individual timepstamp readings
-- 1 = Start timestamp given, forward readings interpolation assuming 5 minutes each
-- 2 = End timestamp given, backwards readings interpolation assuming 5 minutes each
-- 3 = Both start & end timestamp, equal interpolated timestamp readings
