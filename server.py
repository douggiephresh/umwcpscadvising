from flask import Flask, render_template, request, redirect, url_for, send_file
import random, utils

app = Flask(__name__)

# first step, moves program to login.html

@app.route('/', methods = ["GET", "POST"])
def index():
  return render_template("login.html")

# second step, renders login.html, allows access to first entry keyid and admin

@app.route("/login", methods = ["GET", "POST"])
def login():
    return render_template("index.html")

# second step two, allows login using key id  
  
@app.route('/keylogin', methods = ['GET', 'POST'])
def keylogin():
  return render_template("keylogin.html")

# third step, takes information from first login and stores it into database. 
# renders dynamic tables for user interaction

@app.route('/advise', methods = ['GET','POST'])
def adviseMain():
    # first form input values
    studentinfo = {
    'firstname' : request.form['firstname'],
    'lastname' : request.form['lastname'],
    'year' : request.form['year'],
    'track' : request.form['track'],
    'advisor' : request.form['advisor']
    }
    season = ''
    if 'fall' in request.form:
      season = {'season':'fall'}
    if 'spring' in request.form:
      season = {'season':'spring'}
    if 'summer' in request.form:
      season = {'season':'summer'}
    studentinfo.update(season)

    magic = random.randrange(100,9000,1)
    
    print(studentinfo)    
    ### You don't get the gradation semester
    ### year needs to be an int!
    
    ###################################
    # Add above values to database    #
    ###################################    
    db = utils.db_connect()
    cur = db.cursor()
    query = 'INSERT INTO student(magic_id, student_last_name, student_first_name, student_year, student_graduation_semester) VALUES(' + str(magic) + ', \'' + studentinfo['lastname'] + '\', \'' + studentinfo['firstname'] + '\', \'' + str(studentinfo['year']) + '\', \'' + "season"  + '\')'    +';'
    print query
    cur.execute(query)
    query = 'INSERT INTO student_track (student_id, track_id) VALUES (SELECT student_id FROM student WHERE magic_id = ' + '\'' + str(magic) + '\' , ' + ' SELECT track_id FROM track WHERE track_name = ' + '\'' +  studentinfo['track'] + '\'' +  ');'
    print query
    cur.execute(query)
    db.commit()
    #
    ###################################
    # Query Database For All Courses  #
    # Query Database For All Courses  #
    # Offered                         #
    # look at render_tem for next step#
    ################################### 
    
    
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
    profs = [
              {
                 'name':{'tagline': 'davies'}
              },
      
              {
                 'name':{'tagline': 'anewalt'}
              },
      
              {
                 'name':{'tagline': 'polack'}
              },
            ]
    
    # rename the 3 variables to whatever you choose
    # we will need to modify jinja in index.html to grab desired data from queried lists 
    return render_template('index.html', class_name = names, class_name2= names, professors = profs)


# fourth step, processes course checkboxes, creates keyID, redirects to final page with key id
  
@app.route("/process", methods = ["POST","GET"] )
def processForms():
  # Three variables are lists of all checkboxes checked
  checkcomplete = request.values.getlist('checkcomplete')
  checkneed = request.values.getlist('checkneed') # the getlist returns a list of all checked box values
  checkwant = request.values.getlist('checkwant') # you may need to break down to each individual values
  
  ##############################
  # We may need to format the  #
  # lists above                #
  ##############################
  
  
  # debugging
  for i in checkcomplete:
    print(str(i))
  for i in checkneed:
     print(str(i))
  for i in checkwant:
    print(str(i))
    
  #############################
  # need to query variables   
  # into the database
  # do it here  
  #############################
  #QUERY
  
  
  #############################
  # KeyID generation          #
  # Query Student first, last #
  #############################
  rando = random.randrange(100,9000,1)
  
  return render_template("submit.html", keyID = rando)

@app.route('/adminlogin',methods = ['get','post']) #admin login
def adminlogin():
  return render_template('adminlogin.html')


@app.route('/admin-cs',methods = ['get','post']) # admin page
def admin():
  if request.method == 'post' or request.method =='POST':
    print str(request.form['password'])         ########################
    if request.form['password'] == 'CPSCadmin': #### password comparison
      return render_template('admin.html')      ########################
  return redirect('/adminlogin')

@app.route('/uploadcourse',methods = ['get','post'])
def uploadcourses():
   return render_template('uploadcourse.html')

@app.route('/uploadtrack',methods = ['get','post'])
def uploadtracks():
   return render_template('uploadtrack.html')

@app.route('/viewstudents',methods = ['get','post'])
def viewstudents():
   return render_template('viewstudent.html')
  
@app.route('/export', methods = ['get','post']) # export template
def export():
  return render_template('export.html')

@app.route('/students', methods = ['get','post']) # download students
def students():
  return send_file('hold.ods')

@app.route('/classes', methods = ['get','post']) # download classes
def classes():
  return send_file('hold.ods')
  
if __name__ == '__main__':
    ###################################################
    app.debug=True # Remove this line before deliverable
    ####################################################
    app.run(host='0.0.0.0', port=55000)
