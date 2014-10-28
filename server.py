from flask import Flask, render_template, request, redirect, url_for
import MySQLdb, MySQLdb.cursors 
import utils

app = Flask(__name__)



@app.route('/', methods = ['GET','POST'])
def mainIndex():
    #create query list to send to server to display 
    db = utils.db_connect()
    cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
    query = 'SELECT advisor_first_name FROM advisor'
    cur.execute(query)
    profs = cur.fetchall()
    names = [
              {
                 'name':{'tagline': 'helloworld'}
              },
      
              {
                 'name':{'tagline': 'holamundo'}
              },
      
              {
                 'name':{'tagline': 'herroearf'}
              },
           
              {
                 'name':{'tagline': 'bonjour world'}
              },
            ]
    '''profs = [
              {
                 'name':{'tagline': 'davies'}
              },
      
              {
                 'name':{'tagline': 'anewalt'}
              },
      
              {
                 'name':{'tagline': 'polack'}
              },
           
              {
                 'name':{'tagline': 'Rachel'}
              },
            ]'''
    
    return render_template('index.html', class_name = names, class_name2= names, professors = profs)

@app.route("/process", methods = ["POST","GET"] )
def processForms():
  
  student = request.form['student']
  studentid = request.form['studentid']
  year = request.form['year']
  
  return (str(request.values.getlist('1checked'))+ str(request.values.getlist('2checked'))+ student + studentid + year)
  
if __name__ == '__main__':
    app.debug=True
    app.run(host='0.0.0.0', port=3000)

