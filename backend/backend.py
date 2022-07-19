import requests
from flask import Flask, request, jsonify
from flask_mysqldb import MySQL
from datetime import datetime

username = ''

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'test'

mysql = MySQL(app)

#cursor = mysql.connection.cursor()


@app.route('/')
def commonapi():
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    if(current_time == "07:41:19"):
        print("time to water")
    cursor = mysql.connection.cursor()
    var = cursor.execute("select * from plant where plant='tomato'")
    t = cursor.fetchall()
    print(t)
    string = t[0][0]
    return string


@app.route('/api/signin', methods=['POST'])
def signin():
    # print(request.data)
    data = request.get_json()
    username = data['username']
    email = data['email']
    password = data['password']
    cursor = mysql.connection.cursor()
    var = cursor.execute(
        "select username from login where username='" + username + "'")
    if(var == 0):
        cursor.execute("insert into login values('" + username +
                       "','" + email + "','" + password + "')")
        mysql.connection.commit()
        # no existing username, all ok
        return jsonify({"answer": "signed up successfully"})

    else:
        # username already existing
        return jsonify({"answer": "password already existing"})


@app.route('/api/login', methods=['POST'])
def login():
    data = request.get_json()
    global username
    username = data['username']
    password = data['password']
    cursor = mysql.connection.cursor()
    var = cursor.execute("select username from login where username='" +
                         username+"' and password='" + password+"'")
    if(var == 0):
        # return jsonify({"answer": "credentials not match or account not found"},204)
        return('', 204)
    else:
        return jsonify({"answer": "account found"})


@app.route('/api/plantdetails', methods=['POST'])
def plantdetails():
    data = request.get_json()
    plantspecified = data['plant']
    cursor = mysql.connection.cursor()
    cursor.execute("select * from plant where plant='" + plantspecified + "'")
    t = cursor.fetchall()
    # print(t)
    cols = ["plant", "planting_season", "chemicals", "fertilizers", "rainfall", "sunshine", "temperature",
            "description", "soil_depth", "f0", "f1", "f2", "w0", "w1", "w2", "harvesting_time", "expected_time"]
    d = dict()
    for i in zip(cols, list(t[0])):
        d[i[0]] = i[1]

    cursor.execute("select url from pic where plant='" + plantspecified + "'")
    t = cursor.fetchall()
    d['pic'] = t[0][0]

    return jsonify(d)


@app.route('/api/trackmyplants', methods=['POST'])
def trackmyplants():
    cursor = mysql.connection.cursor()
    cursor.execute(
        "select selection_id,selected_plant from selections where username='" + username + "'")
    t = cursor.fetchall()
    cols = ["selection_id", "selected_plant"]
    d = dict()
    for i in zip(cols, list(t[0])):
        d[i[0]] = i[1]

    return jsonify(d)


@app.route('/api/addplant', methods=['POST'])
def addplant():
    data = request.get_json()
    planttoadd = data['plant']
    cursor = mysql.connection.cursor()
    cursor.execute("select max(selection_id) from selections")
    t = cursor.fetchall()
    if(t[0][0] == None):
        newid = 0
    else:
        newid = t[0][0]+1
    #cursor = mysql.connection.cursor()
    cursor.execute("insert into selections values('" + username +
                   "','" + planttoadd + "'," + str(newid) + "," + "curdate())")
    mysql.connection.commit()
    return jsonify({"answer": "plant added"})


@app.route('/api/removeplant', methods=['POST'])
def removeplant():
    data = request.get_json()
    s_id = data['selection_id']
    cursor = mysql.connection.cursor()
    cursor.execute("delete from selections where selection_id=" + str(s_id))
    cursor.connection.commit()
    return jsonify({"answer": "plant removed"})


@app.route('/api/detailsofselectedplants', methods=['POST'])
def detailsofselectedplants():
    data = request.get_json()
    plantspecified = data['plant']
    sel_id = data['selection_id']
    cursor = mysql.connection.cursor()
    cursor.execute("select * from plant where plant='" + plantspecified + "'")
    t = cursor.fetchall()
    # print(t)
    cols = ["plant", "planting_season", "chemicals", "fertilizers", "rainfall", "sunshine", "temperature",
            "description", "soil_depth", "f0", "f1", "f2", "w0", "w1", "w2", "harvesting_time", "expected_time"]
    d = dict()
    for i in zip(cols, list(t[0])):
        d[i[0]] = i[1]

    cursor.execute("select start_date from selections where username='" +
                   username + "'and selection_id=" + str(sel_id))
    t = cursor.fetchall()
    d['start_date'] = t[0][0]
    cursor.execute("select datediff('" + str(t[0][0]) + "',curdate())")
    #print("select datediff('"+ str(t[0][0]) +"',curdate())")
    t = cursor.fetchall()
    d['day count'] = t[0][0]
    cursor.execute("select url from pic where plant='" + plantspecified + "'")
    t = cursor.fetchall()
    d['pic'] = t[0][0]

    return jsonify(d)


@app.route('/api/dailyupdate', methods=['POST'])
def dailyupdate():
    api_key = "3e924053c3de16ff4528fca5cc52304a"
    d = dict()
    dt = datetime.now()
    dayofweek = dt.weekday()  # day of the week 0-monday......6-sunday

    cursor = mysql.connection.cursor()
    cursor.execute("select distinct username from selections")
    t = cursor.fetchall()
    length = len(t)
    userlist = []
    for i in range(length):
        userlist.append(t[i][0])
    print(userlist)
    for i in userlist:
        instruction = ""
        cursor.execute(
            "select selection_id,location,selected_plant from selections where username='" + i + "'")
        t = cursor.fetchall()
        for j in t:
            fertilizer = " "
            sel_id = j[0]
            loc = j[1]
            plantname = j[2]
            cursor.execute(
                "select f0,f1,f2,w0,w1,w2 from plant where plant='" + plantname + "'")
            t2 = cursor.fetchall()
            f0 = t2[0][0]
            f1 = t2[0][1]
            f2 = t2[0][2]
            w0 = t2[0][3]
            w1 = t2[0][4]
            w2 = t2[0][5]

            weather_url = requests.get(
                f'http://api.openweathermap.org/data/2.5/forecast?q={loc}&cnt=5&appid={api_key}')
            weather_data = weather_url.json()
            weather_desc1 = weather_data['list'][0]['weather'][0]['main']
            weather_desc2 = weather_data['list'][1]['weather'][0]['main']
            weather_desc3 = weather_data['list'][2]['weather'][0]['main']
            weather_desc4 = weather_data['list'][3]['weather'][0]['main']
            weather_desc5 = weather_data['list'][4]['weather'][0]['main']

            if(weather_desc1 == 'Rain' or weather_desc2 == 'Rain' or weather_desc3 == 'Rain' or weather_desc4 == 'Rain' or weather_desc5 == 'Rain'):
                instruction = instruction + " "+i+" there might be rain today you dont need to water the plant " + \
                    plantname + " with id " + str(sel_id)
            else:
                cursor.execute("select start_date from selections where username='" +
                               i + "'and selection_id=" + str(sel_id))
                t3 = cursor.fetchall()
                cursor.execute(
                    "select datediff('" + str(t3[0][0]) + "',curdate())")
                t4 = cursor.fetchall()
                day_count = abs(t4[0][0])
                # print(type(day_count))

                if(not(w2.isalpha())):
                    if(day_count >= int(w2.split(',')[0])):
                        frequency = w2.split(',')[1]
                        print(w2.split(',')[0])
                        if(frequency == 0):
                            instruction = instruction + ""
                        if(frequency == 1 and dayofweek == 0):
                            instruction = instruction + " " + i + " water the plant " + \
                                plantname + " with id " + str(sel_id)
                        if(frequency == 2 and (dayofweek == 0 or dayofweek == 3)):
                            instruction = instruction + " " + i + " water the plant " + \
                                plantname + " with id " + str(sel_id)
                        if(frequency == 3 and (dayofweek == 0 or dayofweek == 3 or dayofweek == 6)):
                            instruction = instruction + " " + i + " water the plant " + \
                                plantname + " with id " + str(sel_id)
                        if(frequency == 4 and (dayofweek == 0 or dayofweek == 2 or dayofweek == 4 or dayofweek == 6)):
                            instruction = instruction + " " + i + " water the plant " + \
                                plantname + " with id " + str(sel_id)
                        if(frequency == 5 and (dayofweek == 0 or dayofweek == 2 or dayofweek == 3 or dayofweek == 5 or dayofweek == 6)):
                            instruction = instruction + " " + i + " water the plant " + \
                                plantname + " with id " + str(sel_id)

                    elif(not(w1.isalpha())):
                        if(day_count >= int(w1.split(',')[0])):
                            print("hi")
                            frequency = w1.split(',')[1]
                            if(frequency == 0):
                                instruction = instruction + ""
                            if(frequency == 1 and dayofweek == 0):
                                instruction = instruction + " " + i + " water the plant " + \
                                    plantname + " with id " + str(sel_id)
                            if(frequency == 2 and (dayofweek == 0 or dayofweek == 3)):
                                instruction = instruction + " " + i + " water the plant " + \
                                    plantname + " with id " + str(sel_id)
                            if(frequency == 3 and (dayofweek == 0 or dayofweek == 3 or dayofweek == 6)):
                                instruction = instruction + " " + i + " water the plant " + \
                                    plantname + " with id " + str(sel_id)
                            if(frequency == 4 and (dayofweek == 0 or dayofweek == 2 or dayofweek == 4 or dayofweek == 6)):
                                instruction = instruction + " " + i + " water the plant " + \
                                    plantname + " with id " + str(sel_id)
                            if(frequency == 5 and (dayofweek == 0 or dayofweek == 2 or dayofweek == 3 or dayofweek == 5 or dayofweek == 6)):
                                instruction = instruction + " " + i + " water the plant " + \
                                    plantname + " with id " + str(sel_id)
                        else:

                            if(w0.isnumeric()):
                                w0 = int(w0)
                                if(w0 == 1 and dayofweek == 0):
                                    instruction = instruction + " " + i + " water the plant " + \
                                        plantname + " with id " + str(sel_id)
                                if(w0 == 2 and (dayofweek == 0 or dayofweek == 3)):
                                    instruction = instruction + " " + i + " water the plant " + \
                                        plantname + " with id " + str(sel_id)
                                if(w0 == 3 and (dayofweek == 0 or dayofweek == 3 or dayofweek == 6)):
                                    instruction = instruction + " " + i + " water the plant " + \
                                        plantname + " with id " + str(sel_id)
                                if(w0 == 4 and (dayofweek == 0 or dayofweek == 2 or dayofweek == 4 or dayofweek == 6)):
                                    instruction = instruction + " " + i + " water the plant " + \
                                        plantname + " with id " + str(sel_id)
                                if(w0 == 5 and (dayofweek == 0 or dayofweek == 2 or dayofweek == 3 or dayofweek == 5 or dayofweek == 6)):
                                    instruction = instruction + " " + i + " water the plant " + \
                                        plantname + " with id " + str(sel_id)
                            else:
                                instruction = instruction + " " + i + " water the plant " + \
                                    plantname + " with id " + str(sel_id)

            cursor.execute("select start_date from selections where username='" +
                           i + "'and selection_id=" + str(sel_id))
            t5 = cursor.fetchall()
            cursor.execute(
                "select datediff('" + str(t5[0][0]) + "',curdate())")
            t6 = cursor.fetchall()
            day_count = abs(t6[0][0])
            # print(type(day_count))
            if(day_count == int(f2.split(',')[0])):
                fertilizer = f2.split(',')[1]
                print(f2.split(',')[0])
                instruction = instruction + " " + i + " give the fertilizer :" + \
                    fertilizer+", to the " + plantname + \
                    " with id " + str(sel_id)
            elif(day_count == int(f1.split(',')[0])):
                fertilizer = f1.split(',')[1]
                print(f1.split(',')[0])
                instruction = instruction + " " + i + " give the fertilizer :" + \
                    fertilizer+", to the " + plantname + \
                    " with id " + str(sel_id)
            elif(day_count == 0):
                fertilizer = f0.split(',')[0]
                instruction = instruction + " " + i + " give the fertilizer :" + \
                    fertilizer+", to the " + plantname + \
                    " with id " + str(sel_id)
        d[i] = instruction
    return jsonify(d)


# print("hi")
app.run(host='0.0.0.0', port=5000)
