from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)



@app.route('/', methods = ['GET','POST'])
def mainIndex():
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
    
    
    return render_template('index.html', class_name = names)

@app.route("/process", methods = ["GET", "POST"] )
def processForms():
  checked = request.values.getlist('ischecked')
  #return render_template('schedule.html', completed = checked.getlist('u'))  
  return str(request.values.getlist('ischecked'))
  
if __name__ == '__main__':
    app.debug=True
    app.run(host='0.0.0.0', port=3000)
