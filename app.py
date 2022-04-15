import json
from flask import Flask,render_template,url_for, request,jsonify,session,flash,redirect,send_file
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
from werkzeug.utils import append_slash_redirect
from flask_mail import Mail, Message
import xlwt
from pandas import json_normalize 
import pandas.io.sql as psql
import os

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
   session.clear()
    
   # Redirect to login page
   return redirect(url_for('login'))

@app.route('/profile', methods=['POST', 'GET'])
def profile():
    # Check if user is loggedin
    if 'loggedin' in session:
        if request.method == 'POST':
            if 'new_username' in request.form:
                if request.form['new_username'] != '':
                    # Create variables for easy access
                    new_username = request.form['new_username']
                    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
                    cursor.execute('UPDATE accounts SET username = %s WHERE username = %s', (new_username, session['username'],))
                    mysql.connection.commit()
                    session['username'] = new_username
            if 'new_email' in request.form:
                if request.form['new_email'] != '':
                    # Create variables for easy access
                    new_email = request.form['new_email']
                    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
                    cursor.execute('UPDATE accounts SET email = %s WHERE username = %s', (new_email, session['username'],))
                    mysql.connection.commit()
            return redirect(url_for('home'))    
        elif request.method == 'GET':
            username =  session['username']
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM accounts WHERE username = "{0}" '.format(username))
            account = cursor.fetchone()
            if session['acc_type'] == 'Staff':
                return render_template('Edit.Profil.html', username=username, email=account['email'], profile_picture=account['user_photo'])
            elif session['acc_type'] == 'Admin':
                return render_template('Edit.Profil.Admin.html', username=username, email=account['email'], profile_picture=account['user_photo'])
    return redirect(url_for('login'))

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
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM bahan_cutting ORDER BY kode_barang ASC')
        data_bahan_cutting = cursor.fetchall()
        # User is loggedin show them the home page
        if session['acc_type'] == 'Staff':
            return render_template('Bahan.Cutting.html', username=session['username'],data_bahan_cutting=data_bahan_cutting)
        elif session['acc_type'] == 'Admin':
            return render_template('Bahan.Cutting.Admin.html', username=session['username'],data_bahan_cutting=data_bahan_cutting)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

@app.route('/kaos_polos', methods=['POST', 'GET'])
def kaos_polos():
    # Check if user is loggedin
    if 'loggedin' in session:
        if request.method == 'GET':
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM kaos_polos ORDER BY kode_barang ASC')
            data_kaos_polos = cursor.fetchall()
            # User is loggedin show them the home page
            if session['acc_type'] == 'Staff':
                return render_template('Kaos.Polos.html', username=session['username'],data_kaos_polos=data_kaos_polos)
            elif session['acc_type'] == 'Admin':
                return render_template('Kaos.Polos.Admin.html', username=session['username'],data_kaos_polos=data_kaos_polos)
        elif request.method == 'POST':
             if request.form['export'] == 'Export':
                df=psql.read_sql('SELECT * FROM kaos_polos ORDER BY kode_barang ASC', con=mysql.connection)
                df.to_excel('./data_export/kaos_polos.xlsx', index=False)
                return send_file("./data_export/kaos_polos.xlsx", as_attachment=True)
        return redirect(url_for('kaos_polos'))
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))
        
@app.route('/kaos_original', methods=['POST', 'GET'])
def kaos_original():
    #check if user is loggedin
    if 'loggedin' in session:
        if request.method == 'GET':
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM kaos_original ORDER BY kode_barang ASC')
            data_kaos_original = cursor.fetchall()
            #user is loggedin show them the home page
            if session['acc_type'] == 'Staff':
                return render_template('Kaos.Original.html', username=session['username'], data_kaos_original=data_kaos_original)
            elif session['acc_type'] == 'Admin':
                return render_template('Kaos.Original.Admin.html', username=session['username'], data_kaos_original=data_kaos_original)
        elif request.method == 'POST':
             if request.form['export'] == 'Export':
                df=psql.read_sql('SELECT * FROM kaos_original ORDER BY kode_barang ASC', con=mysql.connection)
                df.to_excel('./data_export/kaos_original.xlsx', index=False)
                return send_file("./data_export/kaos_original.xlsx", as_attachment=True)
                # return redirect(url_for('kaos_original'))
        return redirect(url_for('kaos_original'))
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))
        
@app.route('/history_update', methods=['POST', 'GET'])
def history_update():
    #check if user is loggedin
    if 'loggedin' in session:
        #user is loggedin show them the home page
        if session['acc_type'] == 'Admin':
            return render_template('Histori.Update.html', username=session['username'])
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))
        
@app.route('/manajemen_akun', methods=['POST', 'GET'])
def manajemen_akun():
    #check if user is loggedin
    if 'loggedin' in session:
        if request.method == 'GET':
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM accounts ORDER BY acc_type ASC')
            accounts = cursor.fetchall()
            #user is loggedin show them the home page
            if session['acc_type'] == 'Admin':
                return render_template('Manajemen.Akun.html', username=session['username'], accounts=accounts)
        elif request.method == 'POST':
            username = request.form['username']
            return redirect (url_for('.edit_detail_akun', username=username))
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))
            
        
@app.route('/edit_detail_akun/<username>', methods=['POST', 'GET'])
def edit_detail_akun(username):
    if 'loggedin' in session and session['acc_type'] == 'Admin':
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM accounts WHERE username = "{0}" '.format(username))
        account = cursor.fetchone()
        print(request.method)
        return render_template('Edit.Manajemen.Akun.html', account=account)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))
        
@app.route('/edit_bahan_cutting', methods=['POST', 'GET'])
def edit_bahan_cutting():
    #check if user is loggedin
    if 'loggedin' in session:
        #user is loggedin show them the home page
        if session['acc_type'] == 'Admin':
            return render_template('Edit.Bahan.Cutting.html', username=session['username'])
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))
        
        
@app.route('/edit_kaos_polos', methods=['POST', 'GET'])
def edit_kaos_polos():
    #check if user is loggedin
    if 'loggedin' in session:
        #user is loggedin show them the home page
        if session['acc_type'] == 'Admin':
            return render_template('Edit.Kaos.Polos.html', username=session['username'])
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))
        
@app.route('/edit_kaos_original', methods=['POST', 'GET'])
def edit_kaos_original():
    #check if user is loggedin
    if 'loggedin' in session:
        #user is loggedin show them the home page
        if session['acc_type'] == 'Admin':
            return render_template('Edit.Kaos.Original.html', username=session['username'])
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))


if __name__ == "__main__": 
    app.run(host='0.0.0.0', port=5000, debug=True)