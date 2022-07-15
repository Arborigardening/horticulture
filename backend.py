from flask import Flask,request,jsonify
from flask_mysqldb import MySQL
username = ''

app = Flask(__name__)

app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']=''
app.config['MYSQL_DB']='test'

mysql=MySQL(app)

#cursor = mysql.connection.cursor()


@app.route('/')
def google():
    cursor = mysql.connection.cursor()
    var=cursor.execute("select * from plant where plant='tomato'")
    t=cursor.fetchall()
    print(t)
    string=t[0][0]
    return string


@app.route('/api/signin')
def signin():
    print(request.data)
    data = request.get_json()
    username = data['username']
    email=data['email']
    password=data['password']
    cursor = mysql.connection.cursor()
    var=cursor.execute("select username from login where username='"+ username +"'")
    if(var==0):
        cursor.execute("insert into login values('" + username + "','" + email + "','" + password +"')")
        return jsonify({"answer": "signed up successfully"})    #no existing username, all ok      
    else:
        return jsonify({"answer": "password already existing"})    # username already existing

@app.route('/api/login')
def login():
    data = request.get_json()
    global username 
    username=data['username']
    password=data['password']
    cursor = mysql.connection.cursor()
    var=cursor.execute("select username from login where username='"+username+"' and password='" + password+"'")
    if(var==0):
        return jsonify({"answer": "credentials not match or account not found"})   
    else:
        return jsonify({"answer": "account found"})     

@app.route('/api/plantdetails')
def plantdetails():
    data = request.get_json()
    plantspecified=data['plant']
    cursor = mysql.connection.cursor()
    cursor.execute("select * from plant where plant='" + plantspecified +"'")
    t=cursor.fetchall()
    #print(t)
    cols=["plant","planting_season","chemicals","fertilizers","rainfall","sunshine","temperature","description","soil_depth","f0","f1","f2","w0","w1","w2","harvesting_time","expected_time"]
    d = dict()
    for i in zip(cols, list(t[0])):
        d[i[0]] = i[1]
    
    return d

@app.route('/api/trackmyplants')
def trackmyplants():
    cursor = mysql.connection.cursor()
    cursor.execute("select selection_id,selected_plant,start_date from selections where username='" + username +"'")
    t=cursor.fetchall()
    cols=["selection_id","selected_plant","start_date"]
    d = dict()
    for i in zip(cols, list(t[0])):
        d[i[0]] = i[1]


    return jsonify(d)

@app.route('/api/addplant')
def addplant():
    data = request.get_json()
    planttoadd=data['plant']
    cursor = mysql.connection.cursor()
    cursor.execute("select max(selection_id) from selections")
    t=cursor.fetchall()
    if(t[0][0]==None):
        newid=0
    else:
        newid=t[0][0]+1
    #cursor = mysql.connection.cursor()
    cursor.execute("insert into selections values('"+ username + "','"+ planttoadd +"'," + str(newid) + "," + "curdate())")
    mysql.connection.commit()
    return jsonify({"answer": "plant added"}) 

@app.route('/api/removeplant')
def removeplant():
    data=request.get_json()
    s_id=data['selection_id']
    cursor = mysql.connection.cursor()
    cursor.execute("delete from selections where selection_id="+ str(s_id))
    cursor.connection.commit()
    return jsonify({"answer":"plant removed"})







    
app.run(host='localhost', port=5000)


