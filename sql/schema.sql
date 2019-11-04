BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS date_t
(
	date_id        INTEGER PRIMARY KEY, 
	sql_date       TEXT,    -- Date as a YYYY-MM-DD string
	date           TEXT,    -- date as a local string DD-MM-YYYY
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


CREATE TABLE IF NOT EXISTS time_t
(
	time_id        INTEGER PRIMARY KEY, 
	time           TEXT,  	-- Time as HH:MM string, 24 hour format
	hour           INTEGER, -- hour 00-23
	minute         INTEGER, -- minute 00-59
	second         INTEGER, -- second 00-59
	day_fraction   REAL     -- time as a day fraction between 0 and 1
);


CREATE TABLE IF NOT EXISTS photometer_t
(
	photometer_id INTEGER PRIMARY KEY,
	model         TEXT NOT NULL, -- Photometer model, either SQL or TASS     
	serial_number TEXT NOT NULL, -- SQM serial id or TAS identifier
	tag           TEXT,          -- photometer tag or symbolic name i.e. SEA#08
	fov           REAL,          -- Filed of view, in degrees
	zero_point    REAL,          -- Zero point if known (TAS only)
	valid_since   TEXT DEFAULT (strftime('%Y-%m-%dT%H:%M:%S','now')),     -- timestamp since zero_point value is valid
	valid_until   TEXT DEFAULT '2999-12-31T23:59:59', -- timestamp util  zero_point value is valid
	valid_state   TEXT DEFAULT 'Current'              -- either "Current" or "Expired"
);


CREATE TABLE IF NOT EXISTS site_t
(
	site_id   INTEGER PRIMARY KEY,
	site      TEXT NOT NULL , -- Site Name i.e Cerro de Almodovar
	longitude REAL NOT NULL , -- in floating point degrees, negative west
	latitude  REAL NOT NULL , -- in floating point degrees
	long_sexa TEXT,           -- in printable format ddd mm ss.ss E|W
	lati_sexa TEXT,           -- in printable format  dd mm ss.ss N|S
	altitude  REAL,           -- meters above sea level
	location  TEXT,           -- i.e. Coslada
	province  TEXT,           -- i.e. Madrid
	region    TEXT,           -- i.e. Comunidad de Madrid
	country   TEXT NOT NULL DEFAULT 'España',       -- i.e España
	timezone  TEXT NOT NULL DEFAULT 'Europe/Madrid' -- i.e. Europe/Madrid
	-- PRIMARY KEY (site)
);

CREATE TABLE IF NOT EXISTS observer_t
(
	observer_id  INTEGER PRIMARY KEY,
	name         TEXT NOT NULL, -- Site Name i.e Cerro de Almodovar
	surname      TEXT NOT NULL, -- in floating point degrees, negative west
	nickname     TEXT, -- nickname in epicollect5
	organization TEXT, -- i.e. AstroHenares
	valid_since  TEXT  DEFAULT (strftime('%Y-%m-%dT%H:%M:%S','now')), -- timestamp since organization value is valid
	valid_until  TEXT  DEFAULT '2999-12-31T23:59:59', 
    valid_state  TEXT  DEFAULT 'Current'
    -- PRIMARY KEY (name, surname)
);

CREATE TABLE IF NOT EXISTS photometer_owner_t
(
	photometer_id            INTEGER NOT NULL REFERENCES photometer_t(photometer_id),
	observer_id              INTEGER NOT NULL REFERENCES observer_t(observer_id),
    PRIMARY KEY (photometer_id, observer_id)
);


CREATE TABLE IF NOT EXISTS flags_t
(
	flags_id                  INTEGER PRIMARY KEY, 
	timestamp_method          TEXT,
	temperature_method        TEXT,
	humidity_method           TEXT
);


CREATE TABLE IF NOT EXISTS observation_t
( 
	site_id         INTEGER NOT NULL REFERENCES site_t(site_id),
	observer_id     INTEGER NOT NULL REFERENCES observer_t(observer_id),
	flags_id        INTEGER NOT NULL REFERENCES flags_t(flags_id),
	photometer_id   INTEGER NOT NULL REFERENCES photometer_t(photometer_id),
	date_1_id       INTEGER NOT NULL REFERENCES date_t(date_id),  -- mandatory date (see flags for details)
	time_1_id       INTEGER NOT NULL REFERENCES time_t(time_id),  -- mandatory time (see flags for details)
	date_2_id       INTEGER        L REFERENCES date_t(date_id),  -- optional date (see flags for details)
	time_2_id       INTEGER          REFERENCES time_t(time_id),  -- optional time (see flags for details)
	temperature_1   REAL,    -- observation temperature 1 (see flags for details)
	temperature_2   REAL,    -- observation temperature 2 (see flags for details)
	humidity_1      INTEGER, -- observation humidity 1    (see flags for details)
	humidity_2      INTEGER, -- observation humidity 2    (see flags for details)
	weather         TEXT,    -- ballpark estimation of weather (cloudy, clear, overcast, etc)
	other_observers TEXT,    -- free text for secondary observers            
	comment         TEXT,    -- free text fro comments
	image_url       TEXT,    -- Site image as an URL
	image           BLOB,    -- Site image as an embedded picture
	plot            BLOB,    -- plot from readings
	PRIMARY KEY (site_id,observer_id,photometer_id,date_1_id,time_1_id)
);

CREATE TABLE IF NOT EXISTS readings_t
(
	observation_id   INTEGER NOT NULL REFERENCES observation_t(rowid),
	date_id          INTEGER REFERENCES date_t(date_id),  -- individual readings date stamp
	time_id          INTEGER REFERENCES time_t(time_id),  -- individual readings time stamp
	azimuth          REAL, -- degrees, 0 is South
	altitude         REAL, -- degrees
	magnitude        REAL, -- magnitude/arcser^2
	tsky             REAL  -- Sky temperature in ºC (TAS device only)
);

COMMIT;