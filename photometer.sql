PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
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

COMMIT;
