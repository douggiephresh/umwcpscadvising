# utils.py
import MySQLdb

DATABASE='CPSCAdvisor'
DB_USER = 'website'
DB_PASSWORD = 'CPSCAdvisorsecret'
HOST = 'localhost'

def db_connect():
  return MySQLdb.connect(HOST, DB_USER, DB_PASSWORD, DATABASE, cursorclass=MySQLdb.cursors.DictCursor)
