from flask import Flask, render_template, request, redirect, url_for, send_file, session
import random, utils
import hashlib

import os, xlrd, xlwt
from werkzeug import secure_filename

                                                        ######################
UPLOAD_FOLDER = '/files/' ### modify to rosemary
ALLOWED_EXTENSIONS = set(['xls', 'ods'])                ######################

app = Flask(__name__)
app.config['UPLOAD_FOLDER']= UPLOAD_FOLDER

app.secret_key = 'Zq4oA4Dqq3'

# first step, moves program to login.html

@app.route('/', methods = ["GET", "POST"])
def index():
  return render_template("login.html")

# second step, renders login.html, allows access to first entry keyid and admin

@app.route("/login", methods = ["GET", "POST"])
def login():
    return render_template("index.html")
  
@app.route('/keylogin2', methods = ['GET', 'POST'])
def keylogin2():
  return render_template('keylogin.html')
# second step two, allows login using key id  
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
      season = 'fall'
    if 'spring' in request.form:
      season = 'spring'
    if 'summer' in request.form:
      season = 'summer'
    #studentinfo.update(season)
    db = utils.db_connect()
    cur = db.cursor()

    exists = True
    while exists == True:
      rando = random.randrange(100,9000,1)
      print rando
      quick = 'SELECT student_id FROM student WHERE magic_id = ' + str(rando) + ';'
      cur.execute(quick)
      student = cur.fetchall()
      print student
      if not student:
        exists = False

    #might need to check queery
    
    print(studentinfo)    
    ### You don't get the gradation semester
    ### year needs to be an int!
    session['magic'] = rando
    
    ###################################
    # Add above values to database    #
    ###################################    
    query = 'INSERT INTO student(magic_id, student_last_name, student_first_name, student_year, student_graduation_semester) VALUES(' + str(session['magic']) + ', \'' + studentinfo['lastname'] + '\', \'' + studentinfo['firstname'] + '\', \'' + str(studentinfo['year']) + '\', \'' + season  + '\')'    +';'
    cur.execute(query)

    #student now selected globally
    quick = 'SELECT student_id FROM student WHERE magic_id = '  + str(session['magic']) + ';'
    cur.execute(quick)
    student = cur.fetchall()
    session['studentid'] = str(student[0]['student_id'])
    print session

    quick = 'SELECT track_id FROM track WHERE track_name = \'' +  studentinfo['track'] + '\';'
    print quick
    cur.execute(quick)
    trackid = cur.fetchall()
    print trackid

    query = 'INSERT INTO student_track (student_id, track_id) VALUES (\'' + str(student[0]['student_id']) + '\', \'' + str(trackid[0]['track_id']) + '\');'

    cur.execute(query)
    db.commit()
    #
    ###################################
    # Query Database For All Courses  #
    # Query Database For All Courses  #
    # Offered                         #
    # look at render_tem for next step#
    ################################### 
    query = 'SELECT course_number FROM course;'
    cur.execute(query)
    db.commit()
    names = cur.fetchall()

    query = 'SELECT advisor_last_name FROM advisor;'
    cur.execute(query)
    db.commit()
    profs = cur.fetchall()

    print names, profs
    
    # rename the 3 variables to whatever you choose
    # we will need to modify jinja in index.html to grab desired data from queried lists 
    return render_template('index.html', class_name = names, class_name2= names, professors = profs)


# fourth step, processes course checkboxes, creates keyID, redirects to final page with key id
  
@app.route('/advise2', methods = ['GET','POST'])
def adviseMain2():
    # first form input values
    session['magic'] = request.form['identifier']
    #studentinfo.update(season)
    db = utils.db_connect()
    cur = db.cursor()
    print '\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    query = 'SELECT * FROM student WHERE magic_id =' + str(session['magic'])
    cur.execute(query)
    db.commit()
    person = cur.fetchall()
    print person
    print '\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    quick = 'SELECT student_id FROM student WHERE magic_id = '  + str(session['magic']) + ';'
    cur.execute(quick)
    student = cur.fetchall()
    print str(student) + '$$$$$'
    session['studentid'] = str(student[0]['student_id'])
    print session['studentid']

    query = 'SELECT course_number FROM course;'
    #query = 'SELECT course_number FROM course WHERE course_id IN SELECT course_id FROM track_course WHERE trackid =' +  + ';'
    cur.execute(query)
    db.commit()
    names = cur.fetchall()
    print names

    query = 'SELECT advisor_last_name FROM advisor;'
    cur.execute(query)
    db.commit()
    profs = cur.fetchall()

    print names, profs
    
    # rename the 3 variables to whatever you choose
    # we will need to modify jinja in index.html to grab desired data from queried lists 
    return render_template('index.html', class_name = names, class_name2= names, professors = profs)

@app.route("/process", methods = ["POST","GET"] )
def processForms():
  # Three variables are lists of all checkboxes checked
  checkcomplete = request.values.getlist('checkcomplete')
  checkneed = request.values.getlist('checkneed') # the getlist returns a list of all checked box values
  checkwant = request.values.getlist('checkwant') # you may need to break down to each individual values
  
  db = utils.db_connect()
  cur = db.cursor()
  
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
  print '\n#############################################################'
  for first in checkcomplete:
    print first
    subquery = 'SELECT course_id FROM course WHERE course_number = \'' + str(first) + '\';'
    cur.execute(subquery)
    db.commit()
    subfirst = cur.fetchall()
    print str(subfirst)
    query = 'INSERT INTO student_taken (student_id, course_id) VALUES(\'' + str(session['studentid']) + '\', \'' + str(subfirst[0]['course_id']) + '\');' 
    print query
    cur.execute(query)
    db.commit()
  for second in checkneed:
    print second
    subquery = 'SELECT course_id FROM course WHERE course_number = \'' + str(first) + '\';'
    cur.execute(subquery)
    db.commit()
    subsecond = cur.fetchall()
    print str(subsecond)
    query = 'INSERT INTO student_wanted (student_id, course_id) VALUES(\'' + str(session['studentid']) + '\', \'' + str(subsecond[0]['course_id']) + '\');' 
    print query
    cur.execute(query)
    db.commit()
  for third in checkwant:
    print third
    subquery = 'SELECT course_id FROM course WHERE course_number = \'' + str(first) + '\';'
    cur.execute(subquery)
    db.commit()
    subthird = cur.fetchall()
    print str(subthird)
    print query
    query = 'INSERT INTO student_needed (student_id, course_id) VALUES(\'' + str(session['studentid']) + '\', \'' + str(subthird[0]['course_id']) + '\');'
    cur.execute(query)
    db.commit()
  print '\n#############################################################'

  tempmagic = session['magic']
  session.pop('magic')
  session.pop('studentid')
  
  return render_template("submit.html", keyID = tempmagic)

@app.route('/adminlogin',methods = ['get','post']) #admin login
def adminlogin():
  return render_template('adminlogin.html')

@app.route('/adminprocess',methods = ['get','post']) #admin processing
def adminprocess():
  
  query = "select advisor_user_name from advisor WHERE advisor_password = SHA2('%s', 224)" % (request.form['adminpass'])
  cur.execute(query)
  db.commit()
  admin = cur.fetchall()
  name = str(admin[0]['advisor_user_name'])
  if name == request.form['adminname']:
    return render_template('adminwelcome.html')
  else:
    return render_template('adminlogin.html')


@app.route('/admin-cs',methods = ['get','post']) # admin page
def admin():
  if request.method == 'post' or request.method =='POST':
    print str(request.form['password'])         ########################
    if request.form['password'] == 'CPSCadmin': #### password comparison
      return render_template('admin.html')      ########################
  return redirect('/admin-cs')

@app.route('/uploadtrack',methods = ['get','post'])
def uploadtracks():
    if request.method == 'POST':
        file = request.files['file']
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        workbook = xlrd.open_workbook(os.path.join(app.config['UPLOAD_FOLDER'],filename))
        worksheet = workbook.sheet_by_name('Sheet1')
        num_rows = worksheet.nrows - 1
        num_cells = worksheet.ncols - 1
        curr_row = -1
        while curr_row < num_rows:
          curr_row += 1
          row = worksheet.row(curr_row)
          print 'Row:', curr_row
          curr_cell = -1
          while curr_cell < num_cells:
            curr_cell += 1
            cell_type = worksheet.cell_type(curr_row, curr_cell)
            cell_value = worksheet.cell_value(curr_row, curr_cell)
            print '	', cell_type, ':', cell_value ###### Values per cell in rows
            #### 
        return redirect('/uploadtrack')   
    return render_template('uploadtrack.html')

@app.route('/uploadnext',methods = ['get','post'])
def uploadnext():
    if request.method == 'POST':
        file = request.files['file']
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        workbook = xlrd.open_workbook(os.path.join(app.config['UPLOAD_FOLDER'],filename))
        worksheet = workbook.sheet_by_name('Sheet1')
        numrows = worksheet.nrows - 1
        numcells = worksheet.ncols - 1
        currentrow = -1
        while currentrow < numrows:
          currentrow += 1
          row = worksheet.row(currentrow)
          print 'Row:', currentrow
          currentcell = -1
          while currentcell < numcells:
            currentcell += 1
            celltype = worksheet.cell_type(currentrow, currentcell)
            cellvalue = worksheet.cell_value(currentrow, currentcell)
            print '	', celltype, ':', cellvalue ###### Values per cell in rows
            #### 
        return redirect('/uploadnext')   
    return render_template('uploadnext.html')

@app.route('/viewstudents',methods = ['get','post'])
def viewstudents():
  # query = 'SELECT * FROM student;'
  # cur.execute(query)
  # db.commit()
  # things = cur.fetchall()
  # names = things[0]
   return render_template('viewstudent.html')
  
@app.route('/export', methods = ['get','post']) # export template
def export():
  return render_template('export.html')

@app.route('/students', methods = ['get','post']) # download students
def students():
    db = utils.db_connect()
    cur = db.cursor()
    query = 'SELECT course.course_number, course.course_name, student.student_last_name, student.student_first_name FROM course JOIN student ON student_course.course_id = course.course_id AND student_course.student_id = student_id;'
    cur.execute(query)
    studentData = cur.fetchall()

    ###for number of students or courses...
    #exportStudents = xlwt.Workbook()
    #worksheet = exportStudents.add_sheet('students')
    ### format for write: worksheet.write(row, column, 'text')
    ### for example: worksheet.write(4, 3, 'hello world')

    exportStudentsself.save('students.xls')
    return send_file('~/files/students.xls')

@app.route('/classes', methods = ['get','post']) # download classes
def classes():
  return send_file('~/files/classes.xls')
  
def allowed_file(filename):
  return '.' in filename and filename.rsplit('.',1)[1] in ALLOWED_EXTENSIONS 
  
if __name__ == '__main__':
    ###################################################
    app.debug=True # Remove this line before deliverable
    ####################################################
    app.run(host='0.0.0.0', port=55000)
 
