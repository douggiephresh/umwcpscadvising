# utils.py
import MySQLdb, MySQLdb.cursors 

DATABASE='CPSCAdvisor'
DB_USER = 'CPSCadvising'
DB_PASSWORD = 'S1mpleS1mple'
HOST = 'localhost'

def db_connect():
  return MySQLdb.connect(HOST, DB_USER, DB_PASSWORD, DATABASE, cursorclass=MySQLdb.cursors.DictCursor)
