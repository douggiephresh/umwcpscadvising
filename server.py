from flask import Flask, render_template, request, redirect, url_for
import utils
app = Flask(__name__)

#index route. renders the login page
@app.route('/', methods = ["GET", "POST"])
def index():
  return render_template("login.html")

# login route. renders admin or index based on user input
@app.route("/login", methods = ["GET", "POST"])
def login():
  identify = request.form['identifier']
  if request.method == "POST":
    if identify == "admin":
	return render_template("admin.html")
    else:
	return redirect('index.html')
  return render_template("index.html")

# process route. Action triggered by advise form submit
@app.route("/process", methods = ["POST","GET"] )
def processForms():
  
  student = request.form['student']
  studentid = request.form['studentid']
  year = request.form['year']
  
  return (str(request.values.getlist('1checked'))+ str(request.values.getlist('2checked'))+ student + studentid + year)

# advise route. Renders dynamic form page using database. 
@app.route('/advise', methods = ['GET','POST'])
def adviseMain():
    #create query list to send to server to display 
    
	db = utils.db_connect()
	cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
	query = 'SELECT * FROM advisor	'
	cur.execute(query)
	rows = cur.fetchall()
# remove below once cur.fetchall() works	
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
           
              {
                 'name':{'tagline': 'Rachel'}
              },
            ]
    
    return render_template('index.html', class_name = names, class_name2= names, professors = profs)

if __name__ == '__main__':
    app.debug=True
    app.run(host='0.0.0.0', port=55000)
