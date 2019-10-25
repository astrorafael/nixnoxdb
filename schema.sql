BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS date_t
(
	date_id        INTEGER PRIMARY KEY, 
	sql_date       TEXT,    -- Date as a YYYY-MM-DD string
	date           TEXT,    -- date as a local string DD-MM-YYY
	day            INTEGER, -- day within month (1 .. 31)
	day_year       INTEGER, -- day within the year 1..366
	julian_day     REAL,    -- day as Julian Day
	weekday        TEXT,    -- Monday, Tuesday, ...
	weekday_abbr   TEXT,    -- Abbreviated weekday: Mon, Tue, ...
	weekday_num    INTEGER, -- weekday as number 0=Sunday
	month_num      INTEGER, -- month as number: Jan=1, Feb=2, ..
	month          TEXT,    -- January, February, ...
	month_abbr     TEXT,    -- Jan, Feb, ...
	year           INTEGER  -- Year (2000, 2001, ...)
);

CREATE VIEW IF NOT EXISTS start_date_v AS SELECT * FROM date_t;
CREATE VIEW IF NOT EXISTS end_date_v   AS SELECT * FROM date_t;

CREATE TABLE IF NOT EXISTS time_t
(
	time_id        INTEGER PRIMARY KEY, 
	time           TEXT,  	-- Time as HH:MM string, 24 hour format
	hour           INTEGER, -- hour 00-23
	minute         INTEGER, -- minute 00-59
	second         INTEGER, -- second 00-59
	day_fraction   REAL     -- time as a day fraction between 0 and 1
);

CREATE VIEW IF NOT EXISTS start_time_v AS SELECT * FROM time_t;
CREATE VIEW IF NOT EXISTS end_time_v   AS SELECT * FROM time_t;

CREATE TABLE IF NOT EXISTS photometer_t
(
	photometer_id INTEGER PRIMARY KEY AUTOINCREMENT,
	model         TEXT, -- Photometer model, either SQL or TASS     
	serial_number TEXT, -- SQM serial id or TAS identifier
	fov           REAL, -- Filed of view, in degrees
	zero_point    REAL, -- Zero point if known (TAS only)
	valid_since   TEXT,                               -- timestamp since zero_point value is valid
	valid_until   TEXT DEFAULT '2999-12-31T23:59:59', -- timestamp util  zero_point value is valid
	valid_state   TEXT DEFAULT 'Current'              -- either "Current" or "Expired"
);

CREATE TABLE IF NOT EXISTS site_t
(
	site_id          INTEGER PRIMARY KEY,
	site             TEXT, -- Site Name i.e Cerro de Almodovar
	longitude        REAL, -- in floating point degrees, negative west
	latitude         REAL, -- in floating point degrees
	elevation        REAL, -- meters above sea level
	location         TEXT, -- i.e. Coslada
	province         TEXT, -- i.e. Madrid
	country          TEXT  -- i.e España
);

CREATE TABLE IF NOT EXISTS observer_t
(
	observer_id  INTEGER PRIMARY KEY,
	name         TEXT, -- Site Name i.e Cerro de Almodovar
	surname      TEXT, -- in floating point degrees, negative west
	nickname     TEXT, -- nickname in epicollect5
	organization TEXT, -- i.e. AstroHenares
	valid_since  TEXT, -- timestamp since organization value is valid
	valid_until  TEXT  DEFAULT '2999-12-31T23:59:59', -- timestamp until organization value is valid
	valid_state  TEXT  DEFAULT 'Current'              -- either "Current" or "Expired"
);

CREATE TABLE IF NOT EXISTS group_t
(
	group_id     INTEGER NOT NULL,
	observer_id  INTEGER NOT NULL REFERENCES observer_t(observer_id),
	PRIMARY KEY (group_id, observer_id)
);

CREATE TABLE IF NOT EXISTS flags_t
(
	flags_id                  INTEGER PRIMARY KEY, 
	timestamp_method          TEXT
);

	
CREATE TABLE IF NOT EXISTS observation_t
(
	observation_id   		 INTEGER PRIMARY KEY, 
	start_date_id   		 INTEGER REFERENCES start_date_v(date_id), 
	start_time_id   		 INTEGER REFERENCES start_time_v(time_id), 
	end_date_id     		 INTEGER REFERENCES end_date_v(date_id), 
	end_time_id      		 INTEGER REFERENCES end_time_v(time_id), 
	photometer_id            INTEGER NOT NULL REFERENCES photometer_t(photometer_id),
	site_id                  INTEGER NOT NULL REFERENCES site_t(site_id),
	observer_id              INTEGER NOT NULL REFERENCES observer_t(observer_id),
	additional_observers_id  INTEGER REFERENCES group_t(group_id),
	observation_id           INTEGER NOT NULL REFERENCES observation_t(observation_id),
	flags_id                 INTEGER NOT NULL REFERENCES flags_t(flags_id),
	comment          		 TEXT,
	image_url        		 TEXT,	-- Site image as an UTL
	image            		 BLOB,  -- Site image as an embdeed picture
	plot            		 BLOB   -- plot from readings
);

-- Possible values for timestamp_method are:
-- 0 = Individual timepstamp readings
-- 1 = Start timestamp given, forward readings interpolation assuming 5 minutes each
-- 2 = End timestamp given, backwards readings interpolation assuming 5 minutes each
-- 3 = Both start & end timestamp, equal interpolated timestamp readings

CREATE TABLE IF NOT EXISTS readings_t
(
	readings_id      INTEGER PRIMARY KEY, 
	observation_id   INTEGER NOT NULL REFERENCES observation_t(observation_id),
	date_id          INTEGER REFERENCES date_t(date_id),  -- individual readings date stamp
	time_id          INTEGER REFERENCES time_t(time_id),  -- individual readings time stamp
	azimuth          REAL,
	altitude         REAL,
	magnitude        REAL,
);

COMMIT;