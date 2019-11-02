#--------------------
# System wide imports
# -------------------
from __future__ import generators, division, absolute_import    # needs to be at the top of your module

import os
import os.path
import sys
import argparse
import sqlite3
import datetime
import time

# ------------------------
# Module Utility Functions
# ------------------------

def julian_day(date):
    '''Returns the Julian day number of a date at 0h UTC.'''
    a = (14 - date.month)//12
    y = date.year + 4800 - a
    m = date.month + 12*a - 3
    return (date.day + ((153*m + 2)//5) + 365*y + y//4 - y//100 + y//400 - 32045) - 0.5


# ============================================================================ #
#                               DATE TABLE (DIMENSION)
# ============================================================================ #

class Table(object):
    '''Table object with generic template method'''

    def __init__(self, connection):
        '''Create a table and stores a synchronous reference to the database
        for initialization purposes'''
        self.connection = connection
        # Asynchronous coonection pool se to None at this stage
        self.pool = None

    def indices(self):
        '''
        Default index creation implementation for those tables
        that do not create indices
        '''
        return

    def views(self):
        '''
        Create views for outrigger dimensions if neccessary
        '''
        return

    def schema(self, json_dir):
        '''
        Generates a table, taking an open data connection
        and a replace flag.
        '''
        self.table()
        self.indices()
        self.views()
        self.populate(json_dir)

class Date(Table):

    ONE         = datetime.timedelta(days=1)

    def __init__(self, connection):
        '''Create and Populate the SQLite Date Table'''
        Table.__init__(self, connection)

    def schema(self, date_fmt, year_start, year_end):
        '''
        Overrides generic schema mehod with custom params.
        '''
        self.__fmt   = date_fmt
        self.__start = datetime.date(year_start,1,1)
        self.__end   = datetime.date(year_end,12,31)
        self.table()
        self.populate(None)

      
    def table(self):
        '''
        Create the SQLite Date Table
        '''
        self.connection.execute(
            '''
            CREATE TABLE IF NOT EXISTS date_t
            (
            date_id        INTEGER PRIMARY KEY, 
            sql_date       TEXT, 
            date           TEXT,
            day            INTEGER,
            day_year       INTEGER,
            julian_day     REAL,
            weekday        TEXT,
            weekday_abbr   TEXT,
            weekday_num    INTEGER,
            month_num      INTEGER,
            month          TEXT,
            month_abbr     TEXT,
            year           INTEGER
            );
            '''
        )
        self.connection.commit()


    def populate(self, json_dir):
        '''
        Populate the SQLite Date Table.
        Returns a Deferred
        '''

        self.connection.executemany( 
            "INSERT OR REPLACE INTO date_t VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)", 
            self.rows() 
        )
        self.connection.commit()


    # --------------
    # Helper methods
    # --------------

    def rows(self):
        '''Generate a list of rows to inject into the table'''
        date = self.__start
        dateList = []
        while date <= self.__end:
            dateList.append(
                (
                    date.year*10000+date.month*100+date.day, # Key
                    str(date),            # SQLite date string
                    date.strftime(self.__fmt),  # date string
                    date.day,             # day of month
                    date.strftime("%j"),  # day of year
                    julian_day(date),     # At midnight
                    date.strftime("%A"),      # weekday name
                    date.strftime("%a"),      # abbreviated weekday name
                    int(date.strftime("%w")), # weekday number (0=Sunday)
                    date.month,               # Month Number
                    date.strftime("%B"),      # Month Name
                    date.strftime("%b"),      # Month Abbr. Name
                    date.year,                # Year
                )
            )
            date = date + Date.ONE
        return dateList



def open_database(dbase_path):
    if not os.path.exists(dbase_path):
       raise IOError("No SQLite3 Database file found at {0}. Exiting ...".format(dbase_path))
    print("Opening database {0}".format(dbase_path))
    return sqlite3.connect(dbase_path)

connection = open_database("nixnox.db")
DateTable = Date(connection)
DateTable.schema("%d/%m/%Y",2000,2036)