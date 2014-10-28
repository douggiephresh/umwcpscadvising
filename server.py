from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

@app.route('/', methods = ["GET", "POST"])
def login():
  return render_template("login.html")

@app.route("/login", methods = ["GET", "POST"])
def index():
  identify = request.form['identifier']
  if request.method == "POST":
    if identify == "admin":
      return render_template("admin.html")
    else:
       names = [{'name':{'tagline': 'helloworld'}},{'name':{'tagline': 'holamundo'}},
      
              {
                 'name':{'tagline': 'herroearf'}
              },
           
              {
                 'name':{'tagline': 'bonjour world'}
              },
            ]
        
    return render_template('index.html', class_name = names, class_name2= names, professors = [
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
                 'name':{'tagline': 'new'}
              },
            ])
  return render_template("index.html")

@app.route("/process", methods = ["POST","GET"] )
def processForms():
  
  student = request.form['student']
  studentid = request.form['studentid']
  year = request.form['year']
  
  return (str(request.values.getlist('1checked'))+ str(request.values.getlist('2checked'))+ student + studentid + year)

@app.route('/advise', methods = ['GET','POST'])
def adviseMain():
    #create query list to send to server to display 
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
    app.run(host='0.0.0.0', port=3000)
