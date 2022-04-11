from flask import Flask,render_template,url_for, request,jsonify,session,flash,redirect
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
from werkzeug.utils import append_slash_redirect
from flask_mail import Mail, Message

#inisialisasi
app = Flask(__name__)
app.secret_key = '069420'
mail= Mail(app)

#Fungsi kirim e-mail
app.config['MAIL_SERVER']='smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USERNAME'] = 'ihzafrh@gmail.com'
app.config['MAIL_PASSWORD'] = 'dolnvpurclfubzjo'
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True
mail = Mail(app)

#Koneksi, inisialisasi DB
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'sokou_lampung'
mysql = MySQL(app)

@app.route('/', methods=['POST', 'GET'])
def function():
    if not 'loggedin' in session:
        return redirect('/login')
    return redirect(url_for('home'))

@app.route('/login', methods=['POST', 'GET'])
def login():
    # Check if user is loggedin
    if not 'loggedin' in session:
        # Output message if something goes wrong...
        msg = ''
        # Check if "username" and "password" POST requests exist (user submitted form)
        if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
            # Create variables for easy access
            username = request.form['username']
            password = request.form['password']
            # Check if account exists using MySQL
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM accounts WHERE username = %s AND password = %s', (username, password,))
            # Fetch one record and return result
            account = cursor.fetchone()
            # If account exists in accounts table in out database
            if account:
                # Create session data, we can access this data in other routes
                session['loggedin'] = True
                session['username'] = account['username']
                session['acc_type'] = account['acc_type']
                
                # Redirect to home page
                return redirect(url_for('home'))
            else:
                # Account doesnt exist or username/password incorrect
                msg = 'Incorrect username/password!'
                print(msg)
        # Show the login form with message (if any)
        return render_template('HalamanLogin.html', msg=msg)
    return redirect(url_for('home'))

@app.route('/logout')
def logout():
    # Remove session data, this will log the user out
#    session.pop('loggedin', None)
#    session.pop('id', None)
#    session.pop('username', None)
#    session.pop('acc_type', None)
   session.clear()
    
   # Redirect to login page
   return redirect(url_for('login'))

# @app.route('/profile', methods=['POST', 'GET'])
# def profile():
#     # Check if user is loggedin
#     if 'loggedin' in session:
#         # We need all the account info for the user so we can display it on the profile page
#         cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
#         cursor.execute('SELECT * FROM accounts WHERE username = %s', (session['username'],))
#         account = cursor.fetchone()
#         # Show the profile page with account info
#         return render_template('profile.html', account=account)
#     # User is not loggedin redirect to login page
#     return redirect(url_for('login'))

@app.route('/profile', methods=['POST', 'GET'])
def profile():
    # Check if user is loggedin
    if 'loggedin' in session:
        if session['acc_type'] == 'Staff':
            return render_template('Profil.Admin.html', username=session['username'])
        elif session['acc_type'] == 'Admin':
            return render_template('Edit.Profil.Admin.html', username=session['username'])

@app.route('/home', methods=['POST', 'GET'])
def home():
    # Check if user is loggedin
    if 'loggedin' in session:
        # User is loggedin show them the home page
        if session['acc_type'] == 'Staff':
            return render_template('Halaman.Staff.html', username=session['username'])
        elif session['acc_type'] == 'Admin':
            return render_template('Halaman.Admin.html', username=session['username'])
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

@app.route('/bahan_cutting', methods=['POST', 'GET'])
def bahan_cutting():
    # Check if user is loggedin
    if 'loggedin' in session:
        # User is loggedin show them the home page
        if session['acc_type'] == 'Staff':
            return render_template('Bahan.Cutting.html', username=session['username'])
        elif session['acc_type'] == 'Admin':
            return render_template('Bahan.Cutting.Admin.html', username=session['username'])
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

@app.route('/kaos_polos', methods=['POST', 'GET'])
def kaos_polos():
    # Check if user is loggedin
    if 'loggedin' in session:
        # User is loggedin show them the home page
        if session['acc_type'] == 'Staff':
            return render_template('Kaos.Polos.html', username=session['username'])
        elif session['acc_type'] == 'Admin':
            return render_template('Kaos.Polos.Admin.html', username=session['username'])
        
@app.route('/kaos_original', methods=['POST', 'GET'])
def kaos_original():
    #check if user is loggedin
    if 'loggedin' in session:
        #user is loggedin show them the home page
        if session['acc_type'] == 'Staff':
            return render_template('Kaos.Original.html', username=session['username'])
        elif session['acc_type'] == 'Admin':
            return render_template('Kaos.Original.Admin.html', username=session['username'])
        
@app.route('/history_update', methods=['POST', 'GET'])
def history_update():
    #check if user is loggedin
    if 'loggedin' in session:
        #user is loggedin show them the home page
        if session['acc_type'] == 'Admin':
            return render_template('Histori.Update.html', username=session['username'])
        
@app.route('/manajemen_akun', methods=['POST', 'GET'])
def manajemen_akun():
    #check if user is loggedin
    if 'loggedin' in session:
        #user is loggedin show them the home page
        if session['acc_type'] == 'Admin':
            return render_template('Manajemen.Akun.html', username=session['username'])

if __name__ == "__main__": 
    app.run(host='0.0.0.0', port=5000, debug=True)