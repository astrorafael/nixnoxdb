
# GENERATE IDA-FORMAT OBSERVATIONS FILE

# ----------------------------------------------------------------------
# Copyright (c) 2017 Rafael Gonzalez.
#
# See the LICENSE file for details
# ----------------------------------------------------------------------

#--------------------
# System wide imports
# -------------------
from __future__ import generators    # needs to be at the top of your module

import os
import os.path
import sys
import argparse
import sqlite3
import datetime
import time

#--------------
# other imports
# -------------

#from . import __version__
__version__ = "0.1.0"

import jinja2
import pytz

# ----------------
# Module constants
# ----------------

UNKNOWN = "Unknown"

DEFAULT_DBASE = "nixnox.db"
DEFAULT_TMPLT = "./IDA-template.j2"
DEFAULT_DIR   = "."
DEFAULT_MONTH = datetime.datetime.utcnow().strftime("%Y-%m")

TSTAMP_FORMAT = "%Y-%m-%dT%H:%M:%S.000"

# -----------------------
# Module global functions
# -----------------------

def createParser():
    # create the top-level parser
    parser = argparse.ArgumentParser(prog=sys.argv[0], description="TNIXNOX file generator " + __version__)
    parser.add_argument('-d', '--dbase', default=DEFAULT_DBASE, help='SQLite database full file path')
    parser.add_argument('-t', '--template', default=DEFAULT_TMPLT, help='Jinja2 template file path')
    parser.add_argument('-o', '--out_dir', default=DEFAULT_DIR, help='Output directory to dump record')
    return parser


# ------------------
# Auxiliar functions
# -------------------

# ------------------
# DATABASE FUNCTIONS
# ------------------

def open_database(dbase_path):
    if not os.path.exists(dbase_path):
       raise IOError("No SQLite3 Database file found at {0}. Exiting ...".format(dbase_path))
    print("Opening database {0}".format(dbase_path))
    return sqlite3.connect(dbase_path)


def result_generator(cursor, arraysize=500):
    'An iterator that uses fetchmany to keep memory usage down'
    while True:
        results = cursor.fetchmany(arraysize)
        if not results:
            break
        for result in results:
            yield result


def fetch_observations(connection, options):
    '''From start of month at midnight UTC'''
    cursor = connection.cursor()
    cursor.execute(
        '''
        SELECT rowid,*
        FROM observation_t
        ORDER BY start_date_id ASC, start_time_id ASC
        ''')
    return cursor

def get_observation(resultset):
    keys = ['observation_id', 'site_id', 'observer_id', 'flags_id', 'photometer_id', 'start_date_id', 'start_time_id',
        'end_date_id','end_time_id','temperature_1','temperature_2','humidity_1', 'humidity_2', 'weather',
        'other_observers','comment','image_url','image','plot']
    return  { k: v for k, v in dict(zip(keys,resultset)).items() if v is not None}

def get_readings1(connection, observation_id):
    cursor = connection.cursor()
    row = {'observation_id': observation_id}
    cursor.execute(
        '''
        SELECT altitude, azimuth, magnitude
        FROM  readings_t
        WHERE observation_id == :observation_id
        ORDER BY altitude ASC, azimuth ASC
        ''', row)
    result = cursor.fetchall()
    keys = ['altitude','azimuth','magnitude']
    return [ { k: v for k, v in dict(zip(keys,item)).items() if v is not None} for item in result ]

def get_readings2(connection, observation_id):
    cursor = connection.cursor()
    row = {'observation_id': observation_id}
    cursor.execute(
        '''
        SELECT r.altitude, r.azimuth, r.magnitude, r.tsky, d.sql_date || 'T' || t.time || 'Z') AS timestamp,
        FROM readings_t AS r
        JOIN date_t     AS d USING (date_id)
        JOIN time_t     AS t USING (time_id) 
        WHERE r.observation_id == :observation_id
        ORDER BY r.altitude ASC, r.azimuth ASC
        ''', row)
    result = cursor.fetchall()
    keys = ['altitude','azimuth','magnitude','tsky','timestamp']
    return [ { k: v for k, v in dict(zip(keys,item)).items() if v is not None} for item in result ]

def get_readings(connection, observation_id, flags):
    if flags['timestamp_method'] == "Individual readings timestamp":
        return get_readings2(connection, observation_id)
    else:
        return get_readings1(connection, observation_id)


def get_observer(connection, observer_id):
    cursor = connection.cursor()
    row = {'observer_id': observer_id}
    cursor.execute(
        '''
        SELECT name, surname, nickname, organization
        FROM  observer_t
        WHERE valid_state == "Current"
        AND   observer_id == :observer_id
        ''', row)
    result = cursor.fetchone()
    keys = ['name','surname', 'nickname', 'organization']
    return { k: v for k, v in dict(zip(keys,result)).items() if v is not None}

def get_photometer(connection, photometer_id):
    cursor = connection.cursor()
    row = {'photometer_id': photometer_id}
    cursor.execute(
        '''
        SELECT model, serial_number, tag, fov, zero_point
        FROM  photometer_t
        WHERE valid_state == "Current"
        AND   photometer_id == :photometer_id
        ''', row)
    result = cursor.fetchone()
    keys = ['model','serial_number','tag','fov','zero_point']
    return { k: v for k, v in dict(zip(keys,result)).items() if v is not None}
    
def get_site(connection, site_id):
    cursor = connection.cursor()
    row = {'site_id': site_id}
    cursor.execute(
        '''
        SELECT site, longitude, latitude, altitude, location, province, region, country, timezone
        FROM  site_t
        WHERE site_id == :site_id
        ''', row)
    result = cursor.fetchone()
    keys = ['site', 'longitude', 'latitude', 'altitude', 'location', 'province', 'region', 'country', 'timezone']
    return { k: v for k, v in dict(zip(keys,result)).items() if v is not None}


def get_date(connection, date_id):
    cursor = connection.cursor()
    row = {'date_id': date_id}
    cursor.execute(
        '''
        SELECT date
        FROM  date_t
        WHERE date_id == :date_id
        ''', row)
    result = cursor.fetchone()
    keys = ['date']
    return { k: v for k, v in dict(zip(keys,result)).items() if v is not None}


def get_time(connection, time_id):
    cursor = connection.cursor()
    row = {'time_id': time_id}
    cursor.execute(
        '''
        SELECT time
        FROM  time_t
        WHERE time_id == :time_id
        ''', row)
    result = cursor.fetchone()
    keys = ['time']
    return { k: v for k, v in dict(zip(keys,result)).items() if v is not None}


def get_flags(connection, flags_id):
    cursor = connection.cursor()
    row = {'flags_id': flags_id}
    cursor.execute(
        '''
        SELECT timestamp_method, temperature_method, humidity_method
        FROM  flags_t
        WHERE flags_id == :flags_id
        ''', row)
    result = cursor.fetchone()
    keys = ['timestamp_method', 'temperature_method', 'humidity_method']
    return { k: v for k, v in dict(zip(keys,result)).items() if v is not None}


# -------------------
# AUXILIARY FUNCTIONS
# -------------------



def mkmonth(datestr):
    return datetime.datetime.strptime(datestr, '%Y-%m')


def render(template_path, context):
    if not os.path.exists(template_path):
        raise IOError("No Jinja2 template file found at {0}. Exiting ...".format(template_path))
    path, filename = os.path.split(template_path)
    return jinja2.Environment(
        loader=jinja2.FileSystemLoader(path or './')
    ).get_template(filename).render(context)


def create_directories(instrument_name, out_dir, year=None):
    sub_dir = os.path.join(out_dir, instrument_name)
    if not os.path.exists(out_dir):
        os.makedirs(out_dir)
    if not os.path.exists(sub_dir):
        os.makedirs(sub_dir)
   
# -------------------
# FILE Generation
# -------------------

def write_NXNX_header_file(result, instrument_name, out_dir, timestamp, suffix):
    '''Writes the IDA header file after contained in result'''
    file_name = instrument_name + timestamp.strftime("_%Y-%m") + suffix + ".txt"
    full_name = os.path.join(out_dir, instrument_name, file_name)
    if sys.version_info[0] > 2:
        result = result.decode('utf-8')
    with open(full_name, 'w') as outfile:
        outfile.write(result)

def write_NXNX_body_file(result, instrument_name, out_dir, timestamp, suffix):
    file_name = instrument_name + timestamp.strftime("_%Y-%m") + suffix + ".txt"
    full_name = os.path.join(out_dir, instrument_name, file_name)
    with open(full_name, 'a') as outfile:
        outfile.write(result)
        outfile.write('\n')

# -------------
# MAIN FUNCTION
# -------------

def get_context(connection, observation_resultset):
    context = {}
    observation = get_observation(observation_resultset)
    # Mandatory items
    context['observation'] = observation
    context['start_date']  = get_date(connection, observation['start_date_id'])
    context['start_time']  = get_time(connection, observation['start_time_id'])
    context['site']        = get_site(connection, observation['site_id'])
    context['observer']    = get_observer(connection, observation['observer_id'])
    context['photometer']  = get_photometer(connection, observation['photometer_id'])
    context['flags']       = get_flags(connection, observation['flags_id'])
    # Optional items
    if 'end_date_id' in observation:
        context['end_date'] = get_date(connection, observation['end_date_id'])
    if 'end_time_id' in observation:
        context['end_time'] = get_time(connection, observation['end_time_id'])
    context['readings'] = get_readings(connection, observation['observation_id'], context['flags'])
    return context


def read_all(connection, options):
    cursor = fetch_observations(connection, options)
    for observation_resultset in result_generator(cursor):
        context = get_context(connection, observation_resultset)
        output = render(options.template, context)
        print(output)
        

def main():
    '''
    Utility entry point
    '''
    try:
        options = createParser().parse_args(sys.argv[1:])
        connection = open_database(options.dbase)
        read_all(connection, options)

    except KeyboardInterrupt:
        print('Interrupted by user ^C')
    #except Exception as e:
        print("Error => {0}".format(e))

main()
