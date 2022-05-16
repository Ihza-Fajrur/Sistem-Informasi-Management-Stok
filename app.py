from os import abort
from MySQLdb import OperationalError
from flask import Flask,render_template,url_for, request,jsonify,session,flash,redirect,send_file
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
from werkzeug.utils import append_slash_redirect
from flask_mail import Mail, Message
import pandas.io.sql as psql
from datetime import datetime 
from threading import Thread
import time
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
app.config['MYSQL_HOST'] = '192.168.1.29'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'sokou_lampung'
mysql = MySQL(app)

try:
    secondary_db = MySQLdb.connect('192.168.1.29','root','','sokou_lampung')
except(MySQLdb.Error, MySQLdb.Warning) as e:
    print(e)

def sales_record_kp():
    time.sleep(10)
    while True:
        try:
            year = time.strftime("%Y")
            month = time.strftime("%m")
            cursor = secondary_db.cursor()
            cursor.execute("SELECT kode_barang FROM kaos_polos")
            data_kode_barang = cursor.fetchall()
            for data in data_kode_barang:
                cursor.execute(f'SELECT id FROM sales_tracking_kp WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{data[0]}"')
                result = cursor.fetchone()
                if result == None:
                    id = f'{data[0]}-{month}-{year}'
                    cursor.execute('INSERT IGNORE INTO sales_tracking_kp (kode_barang, jumlah_pembelian, bulan, tahun, id) VALUES ("{0}", "{1}", "{2}", "{3}", "{4}")'.format(data[0], 0, month, year, id))
                    secondary_db.commit()
            print("synching sales record kaos polos complete")
            cursor.close() 
        except:
            time.sleep(3) 
        time.sleep(10)
        
def sales_record_ko():
    time.sleep(15)
    while True:
        try:
            year = time.strftime("%Y")
            month = time.strftime("%m")
            cursor = secondary_db.cursor()
            cursor.execute("SELECT kode_barang FROM kaos_original")
            data_kode_barang = cursor.fetchall()
            for data in data_kode_barang:
                cursor.execute(f'SELECT id FROM sales_tracking_ko WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{data[0]}"')
                result = cursor.fetchone()
                if result == None:
                    id = f'{data[0]}-{month}-{year}'
                    cursor.execute('INSERT IGNORE INTO sales_tracking_ko (kode_barang, jumlah_pembelian, bulan, tahun, id) VALUES ("{0}", "{1}", "{2}", "{3}", "{4}")'.format(data[0], 0, month, year, id))
                    secondary_db.commit()
            print("synching sales record kaos original complete")
            cursor.close() 
        except:
            time.sleep(3)
        time.sleep(10)
        
def sales_record_bc():
    time.sleep(7)
    while True:
        try:
            year = time.strftime("%Y")
            month = time.strftime("%m")
            cursor = secondary_db.cursor()
            cursor.execute("SELECT kode_barang FROM bahan_cutting")
            data_kode_barang = cursor.fetchall()
            try:
                for data in data_kode_barang:
                    cursor.execute(f'SELECT id FROM sales_tracking_bc WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{data[0]}"')
                    result = cursor.fetchone()
                    if not result:
                        id = f'{data[0]}-{month}-{year}'
                        cursor.execute('INSERT IGNORE INTO sales_tracking_bc (kode_barang, jumlah_pembelian, bulan, tahun, id) VALUES ("{0}", "{1}", "{2}", "{3}", "{4}")'.format(data[0], 0, month, year, id))
                        secondary_db.commit()
                print("synching sales record bahan cutting complete")
                cursor.close() 
            except OperationalError:
                continue
        except:
            time.sleep(3)
        time.sleep(13)
        
def total_penjualan():
    # while True:
    try:
        year = time.strftime("%Y")
        month = time.strftime("%m")
        
        #Kaos Polos
        kp_total_sales = 0
        cursor = secondary_db.cursor()
        cursor.execute(f'SELECT kode_barang FROM sales_tracking_kp')
        time.sleep(1)
        data_kaos_polos = cursor.fetchall()  
        if not data_kaos_polos == None:
            for data in data_kaos_polos:
                cursor.execute(f'SELECT jumlah_pembelian FROM sales_tracking_kp WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{data[0]}"')
                data_kaos_polos = cursor.fetchone()
                if type(data_kaos_polos[0]) == int:
                    kp_total_sales += data_kaos_polos[0]
        #Kaos Original
        ko_total_sales = 0
        cursor.execute(f'SELECT kode_barang FROM sales_tracking_ko')
        data_kaos_original = cursor.fetchall()  
        if data_kaos_original:
            for data in data_kaos_original:
                cursor.execute(f'SELECT jumlah_pembelian FROM sales_tracking_ko WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{data[0]}"')
                data_kaos_original = cursor.fetchone()
                if type(data_kaos_original[0]) == int:
                    ko_total_sales += data_kaos_original[0]
            
        #Bahan Cutting
        bc_total_sales = 0
        cursor.execute(f'SELECT kode_barang FROM sales_tracking_bc')
        data_bahan_cutting = cursor.fetchall() 
        if data_bahan_cutting: 
            for data in data_bahan_cutting:
                cursor.execute(f'SELECT jumlah_pembelian FROM sales_tracking_bc WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{data[0]}"')
                data_bahan_cutting = cursor.fetchone()
                if type(data_bahan_cutting[0]) == int:
                    bc_total_sales += data_bahan_cutting[0]
        cursor.execute(f'SELECT id FROM total_penjualan')
        verify = cursor.fetchone()
        if verify:
            total_sales = kp_total_sales + ko_total_sales
            cursor.execute('UPDATE total_penjualan SET penjualan_kp = %s WHERE id = %s', (kp_total_sales, 1))
            secondary_db.commit()
            cursor.execute('UPDATE total_penjualan SET penjualan_ko = %s WHERE id = %s', (ko_total_sales, 1))
            secondary_db.commit()
            cursor.execute('UPDATE total_penjualan SET penjualan_bc = %s WHERE id = %s', (bc_total_sales, 1))
            secondary_db.commit()
            cursor.execute('UPDATE total_penjualan SET penjualan_total = %s WHERE id = %s', (total_sales, 1))
            secondary_db.commit()
        else:
            cursor.execute('INSERT INTO total_penjualan (id, penjualan_total, penjualan_kp, penjualan_ko, penjualan_bc) VALUES (%s, %s, %s, %s, %s)', (1, 0, 0, 0, 0))
            secondary_db.commit()
        print("synching total penjualan complete")
    except Exception as e:
        print("total penjualan update failed")
        print(e)
        # time.sleep(100)
    # time.sleep(10)
        
def sales_record():
    thread = Thread(target=sales_record_kp, args=())
    thread.daemon = True
    thread.start()

    thread = Thread(target=sales_record_ko, args=())
    thread.daemon = True
    thread.start()

    thread = Thread(target=sales_record_bc, args=())
    thread.daemon = True
    thread.start()
    
    # thread = Thread(target=total_penjualan, args=())
    # thread.daemon = True
    # thread.start()
    
sales_record()

def graph_data_retreval():
    # try:
        cursor = secondary_db.cursor()
        cursor.execute(f'SELECT bulan FROM record_penjualan_tahunan')
        verify = cursor.fetchone()
        if not verify:
            for i in range (1, 13):
                cursor.execute('INSERT INTO record_penjualan_tahunan (bulan, value) VALUES (%s, %s)', (i, 0))
            secondary_db.commit()
        month = int(time.strftime("%m"))
        cursor.execute('SELECT penjualan_total FROM total_penjualan')
        temp = cursor.fetchone()
        cursor.execute(f'SELECT value FROM record_penjualan_tahunan WHERE bulan = {month}')
        var = cursor.fetchone()
        if not var[0] == temp[0]:
            cursor.execute('UPDATE record_penjualan_tahunan SET value = %s WHERE bulan = %s', (temp[0], month))
            secondary_db.commit()
            print("executed")
        cursor.execute(f'SELECT value FROM record_penjualan_tahunan')
        data = cursor.fetchall()
        response = []
        for data in data:
            response.append(data[0])
        return response
    # except Exception as e:
    #     print(e)

@app.route("/graph")
def graph():
    # sales = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
    sales = graph_data_retreval()
    return jsonify(sales)

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
                return render_template('Edit.Profil.html', username=username, user_photo=account['user_photo'], email=account['email'], profile_picture=account['user_photo'])
            elif session['acc_type'] == 'Admin':
                return render_template('Edit.Profil.Admin.html', username=username, user_photo=account['user_photo'], email=account['email'], profile_picture=account['user_photo'])
    return redirect(url_for('login'))

@app.route('/home', methods=['POST', 'GET'])
def home():
    # Check if user is loggedin
    if 'loggedin' in session:
        # User is loggedin show them the home page
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT penjualan_total FROM total_penjualan')
        penjualan_total = cursor.fetchone()
        cursor.execute('SELECT penjualan_kp FROM total_penjualan')
        penjualan_kp = cursor.fetchone()
        cursor.execute('SELECT penjualan_ko FROM total_penjualan')
        penjualan_ko = cursor.fetchone()
        cursor.execute('SELECT penjualan_bc FROM total_penjualan')
        penjualan_bc = cursor.fetchone()
        if penjualan_bc:
            if not penjualan_total['penjualan_total'] == 0:
                presentase_kp = penjualan_kp['penjualan_kp']/penjualan_total['penjualan_total']*100
                presentase_ko = penjualan_ko['penjualan_ko']/penjualan_total['penjualan_total']*100
            else:
                presentase_kp = 0
                presentase_ko = 0
            penjualan_bc = penjualan_bc['penjualan_bc']
        else:
            presentase_kp = 0
            presentase_ko = 0
            penjualan_bc = 0
        if session['acc_type'] == 'Staff':
            total_penjualan()
            return render_template('Halaman.Staff.html',presentase_kp=round(presentase_kp,2), presentase_ko=round(presentase_ko,2), penjualan_bc=penjualan_bc)
        elif session['acc_type'] == 'Admin':
            total_penjualan()
            return render_template('Halaman.Admin.html',presentase_kp=round(presentase_kp,2), presentase_ko=round(presentase_ko,2), penjualan_bc=penjualan_bc)
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
        return redirect(url_for('bahan_cutting'))
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

@app.route('/bahan_cutting_del/<kode_barang>', methods=['POST', 'GET'])
def bahan_cutting_del(kode_barang):
    # Check if user is loggedin
    if 'loggedin' in session:
        #Penambahan stok kaos original
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('DELETE FROM bahan_cutting WHERE kode_barang = %s', (kode_barang,))
        mysql.connection.commit()
        
        #Dokumentasi perubahan ke database
        activity = (f"(DEL) Penghapusan stok bahan cutting dengan kode barang {kode_barang}")
        cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
        mysql.connection.commit()
        
        return redirect(url_for('bahan_cutting'))
    return redirect (url_for('login'))

@app.route('/bahan_cutting_edit/<kode_barang>', methods=['POST', 'GET'])
def bahan_cutting_edit(kode_barang):
    # Check if user is loggedin
    if 'loggedin' in session and session['acc_type'] == 'Admin':
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        if request.method == 'POST':
            kode_barang_changed = False
            
            ukuran_panjang_editted = False
            ukuran_lebar_editted = False
            
            if 'kode_barang' in request.form and not request.form['kode_barang'] == '':
                if request.form['kode_barang'] != kode_barang:
                    # Create variables for easy access
                    new_kode_barang = request.form['kode_barang']
                    try:
                        cursor.execute('UPDATE bahan_cutting SET kode_barang = %s WHERE kode_barang = %s', (new_kode_barang, kode_barang,))
                        mysql.connection.commit()
                        kode_barang_changed = True
                        
                        #Dokumentasi perubahan ke database
                        activity = (f"(EDIT) Pengeditan kode barang {kode_barang} menjadi {new_kode_barang} pada bahan cutting")
                        cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                        mysql.connection.commit()
                        
                    except:
                        cursor.execute('UPDATE IGNORE bahan_cutting SET kode_barang = %s WHERE kode_barang = %s', (new_kode_barang, kode_barang,))
                        mysql.connection.commit()
                        
            if kode_barang_changed:
                kode_barang = new_kode_barang
                
            cursor.execute('SELECT * FROM bahan_cutting WHERE kode_barang = %s', (kode_barang,))
            bahan_cutting = cursor.fetchone()
            
            if 'nama_barang' in request.form and not request.form['nama_barang'] == '':
                if request.form['nama_barang'] != bahan_cutting['nama_barang']:
                    # Create variables for easy access
                    new_nama_barang = request.form['nama_barang']
                    cursor.execute('UPDATE bahan_cutting SET nama_barang = %s WHERE kode_barang = %s', (new_nama_barang, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan nama barang dengan kode barang {kode_barang} dari {bahan_cutting['nama_barang']} menjadi {new_nama_barang} pada bahan cutting")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
                    
            if 'jenis_barang' in request.form and not request.form['jenis_barang'] == '':
                if request.form['jenis_barang'] != bahan_cutting['jenis_barang']:
                    # Create variables for easy access
                    new_jenis_barang = request.form['jenis_barang']
                    cursor.execute('UPDATE bahan_cutting SET jenis_barang = %s WHERE kode_barang = %s', (new_jenis_barang, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan jenis barang dengan kode barang {kode_barang} dari {bahan_cutting['jenis_barang']} menjadi {new_jenis_barang} pada bahan cutting")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
                    
            if 'warna' in request.form and not request.form['warna'] == '':
                if request.form['warna'] != bahan_cutting['warna']:
                    # Create variables for easy access
                    new_warna = request.form['warna']
                    cursor.execute('UPDATE bahan_cutting SET warna = %s WHERE kode_barang = %s', (new_warna, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan warna dengan kode barang {kode_barang} dari {bahan_cutting['warna']} menjadi {new_warna} pada bahan cutting")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
            
            if 'ukuran_panjang' in request.form and not request.form['ukuran_panjang'] == '':
                if int(request.form['ukuran_panjang']) != bahan_cutting['ukuran_panjang']:
                    # Create variables for easy access
                    new_ukuran_panjang = request.form['ukuran_panjang']
                    cursor.execute('UPDATE bahan_cutting SET ukuran_panjang = %s WHERE kode_barang = %s', (new_ukuran_panjang, kode_barang,))
                    mysql.connection.commit()
                    
                    bc_panjang_old = bahan_cutting['ukuran_panjang']
                    bc_panjang_new = new_ukuran_panjang
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan ukuran panjang dengan kode barang {kode_barang} dari {bahan_cutting['ukuran_panjang']} menjadi {new_ukuran_panjang} pada bahan cutting")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
                    ukuran_panjang_editted = True
                    
            if 'ukuran_lebar' in request.form and not request.form['ukuran_lebar'] == '':
                if int(request.form['ukuran_lebar']) != bahan_cutting['ukuran_lebar']:
                    # Create variables for easy access
                    new_ukuran_lebar = request.form['ukuran_lebar']
                    cursor.execute('UPDATE bahan_cutting SET ukuran_lebar = %s WHERE kode_barang = %s', (new_ukuran_lebar, kode_barang,))
                    mysql.connection.commit()

                    bc_lebar_old = bahan_cutting['ukuran_lebar']
                    bc_lebar_new = new_ukuran_lebar
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan ukuran lebar dengan kode barang {kode_barang} dari {bahan_cutting['ukuran_lebar']} menjadi {new_ukuran_lebar} pada bahan cutting")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
                    ukuran_lebar_editted = True
            
            if ukuran_panjang_editted and ukuran_lebar_editted:
                ukuran_lama = int(bc_panjang_old)  * int(bc_lebar_old)
                ukuran_baru = int(bc_panjang_new)  * int(bc_lebar_new)
                if ukuran_lama > ukuran_baru:
                    #Dokumentasi Sales Record
                    year = time.strftime("%Y")
                    month = time.strftime("%m")
                    cursor.execute(f'SELECT jumlah_pembelian FROM sales_tracking_bc WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{kode_barang}"')
                    temp = cursor.fetchone()
                    current_sales = temp['jumlah_pembelian']
                    jumlah_pembelian = current_sales + (ukuran_lama - ukuran_baru)
                    cursor.execute(f'UPDATE sales_tracking_bc SET jumlah_pembelian = {jumlah_pembelian} WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{kode_barang}"')
                    mysql.connection.commit()
            elif ukuran_panjang_editted:
                ukuran_lama = int(bc_panjang_old)  * int(bahan_cutting['ukuran_lebar'])
                ukuran_baru = int(bc_panjang_new)  * int(bahan_cutting['ukuran_lebar'])
                if ukuran_lama > ukuran_baru:
                    #Dokumentasi Sales Record
                    year = time.strftime("%Y")
                    month = time.strftime("%m")
                    cursor.execute(f'SELECT jumlah_pembelian FROM sales_tracking_bc WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{kode_barang}"')
                    temp = cursor.fetchone()
                    if temp:
                        current_sales = temp['jumlah_pembelian']
                        jumlah_pembelian = current_sales + (ukuran_lama - ukuran_baru)
                        cursor.execute(f'UPDATE sales_tracking_bc SET jumlah_pembelian = {jumlah_pembelian} WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{kode_barang}"')
                        mysql.connection.commit()
                    elif not temp:
                        current_sales = 0
                        jumlah_pembelian = current_sales + (ukuran_lama - ukuran_baru)
                        cursor.execute(f'UPDATE sales_tracking_bc SET jumlah_pembelian = {jumlah_pembelian} WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{kode_barang}"')
                        mysql.connection.commit()
            elif ukuran_lebar_editted:          
                ukuran_lama = int(bahan_cutting['ukuran_panjang'])  * int(bc_lebar_old)
                ukuran_baru = int(bahan_cutting['ukuran_panjang'])  * int(bc_lebar_new)
                if ukuran_lama > ukuran_baru:
                    #Dokumentasi Sales Record
                    year = time.strftime("%Y")
                    month = time.strftime("%m")
                    cursor.execute(f'SELECT jumlah_pembelian FROM sales_tracking_bc WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{kode_barang}"')
                    temp = cursor.fetchone()
                    if temp:
                        current_sales = temp['jumlah_pembelian']
                        jumlah_pembelian = current_sales + (ukuran_lama - ukuran_baru)
                        cursor.execute(f'UPDATE sales_tracking_bc SET jumlah_pembelian = {jumlah_pembelian} WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{kode_barang}"')
                        mysql.connection.commit()    
                    elif not temp:
                        current_sales = 0
                        jumlah_pembelian = current_sales + (ukuran_lama - ukuran_baru)
                        cursor.execute(f'UPDATE sales_tracking_bc SET jumlah_pembelian = {jumlah_pembelian} WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{kode_barang}"')
                        mysql.connection.commit()   
                    
            if 'harga_satuan' in request.form and not request.form['harga_satuan'] == '':
                if int(request.form['harga_satuan']) != bahan_cutting['harga_satuan']:
                    # Create variables for easy access
                    new_harga_satuan = request.form['harga_satuan']
                    cursor.execute('UPDATE bahan_cutting SET harga_satuan = %s WHERE kode_barang = %s', (new_harga_satuan, kode_barang,))
                    mysql.connection.commit()
                    cursor.execute('SELECT ukuran_panjang, ukuran_lebar FROM bahan_cutting WHERE kode_barang = "{0}" '.format(kode_barang))
                    ukuran = cursor.fetchone()
                    new_harga_total = int(new_harga_satuan) * int(ukuran['ukuran_panjang']) * int(ukuran['ukuran_lebar'])
                    cursor.execute('UPDATE bahan_cutting SET total_harga = %s WHERE kode_barang = %s', (new_harga_total, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan harga satuan dengan kode barang {kode_barang} dari Rp.{bahan_cutting['harga_satuan']} menjadi Rp.{new_harga_satuan} pada bahan cutting")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
                    
            return redirect(url_for('bahan_cutting'))
        
        elif request.method == 'GET':
            cursor.execute('SELECT * FROM bahan_cutting WHERE kode_barang = "{0}" '.format(kode_barang))
            bahanCutting = cursor.fetchone()
            return render_template('Edit.Bahan.Cutting.html', bahan_cutting = bahanCutting)
    # User is not loggedin redirect to login page
    return redirect (url_for('login'))

@app.route('/bahan_cutting_add', methods=['POST', 'GET'])
def bahan_cutting_add():
    if 'loggedin' in session and session['acc_type'] == 'Admin':
        if request.method == 'GET':
            return render_template('Tambah.Bahan.Cutting.html', username=session['username'],)
        elif request.method == 'POST':
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            # Create variables for easy access
            kode_barang = request.form['kode_barang']
            nama_barang = request.form['nama_barang']
            jenis_barang = request.form['jenis_barang']
            warna = request.form['warna']
            ukuran_panjang = request.form['ukuran_panjang']
            ukuran_lebar = request.form['ukuran_lebar']
            harga_satuan = request.form['harga_satuan']
            total_harga = int(harga_satuan) * int(ukuran_lebar) * int(ukuran_panjang)
            # Check if account exists using MySQL
            cursor.execute('SELECT kode_barang FROM bahan_cutting WHERE kode_barang = "{0}" '.format(kode_barang))
            # Fetch one record and return result
            old_bahan_cutting = cursor.fetchone()
            if not old_bahan_cutting:
                cursor.execute('INSERT INTO bahan_cutting (kode_barang, nama_barang, jenis_barang, warna, ukuran_panjang, ukuran_lebar, harga_satuan, total_harga) VALUES ("{0}", "{1}", "{2}", "{3}", "{4}", "{5}", "{6}", "{7}")'.format(kode_barang, nama_barang, jenis_barang, warna, ukuran_panjang,ukuran_lebar, harga_satuan, total_harga))
                mysql.connection.commit()
                
                #Dokumentasi perubahan ke database
                activity = (f"(ADD) Penambahan stok bahan cutting {nama_barang} dengan kode barang {kode_barang}")
                cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                mysql.connection.commit()
                
                return redirect(url_for('bahan_cutting'))
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))
   
@app.route('/bahan_cutting_export', methods=['POST', 'GET'])
def bahan_cutting_export():
    if 'loggedin' in session:
        df=psql.read_sql('SELECT * FROM bahan_cutting ORDER BY kode_barang ASC', con=mysql.connection)
        df.to_excel('./data_export/bahan_cutting.xlsx', index=False)
        return send_file("./data_export/bahan_cutting.xlsx", as_attachment=True)
    if 'loggedin' in session:
        return redirect(url_for('bahan_cutting'))
    else:
        return redirect(url_for('login'))

@app.route('/kaos_polos', methods=['POST', 'GET'])
def kaos_polos():
    # Check if user is loggedin
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM kaos_polos ORDER BY kode_barang ASC')
        data_kaos_polos = cursor.fetchall()
        # User is loggedin show them the home page
        if session['acc_type'] == 'Staff':
            return render_template('Kaos.Polos.html', username=session['username'],data_kaos_polos=data_kaos_polos)
        elif session['acc_type'] == 'Admin':
            return render_template('Kaos.Polos.Admin.html', username=session['username'],data_kaos_polos=data_kaos_polos)
        return redirect(url_for('kaos_polos'))
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

@app.route('/kaos_polos_dec/<kode_barang>', methods=['POST', 'GET'])
def kaos_polos_dec(kode_barang):
    # Check if user is loggedin
    if 'loggedin' in session:
        #Kaos polos data retrieval
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT jumlah_stok FROM kaos_polos where kode_barang = %s', (kode_barang,))
        kaos_polos = cursor.fetchone()
        
        if not kaos_polos['jumlah_stok']-1 == -1:
            #Pengurangan stok kaos polos
            cursor.execute('UPDATE kaos_polos SET jumlah_stok = %s WHERE kode_barang = %s', (kaos_polos['jumlah_stok']-1, kode_barang,))
            mysql.connection.commit()
            
            #Pembaruan total harga kaos polos
            cursor.execute('SELECT * FROM kaos_polos where kode_barang = %s', (kode_barang,))
            kaos_polos = cursor.fetchone()
            cursor.execute('UPDATE kaos_polos SET total_harga = %s WHERE kode_barang = %s', (kaos_polos['jumlah_stok']*kaos_polos['harga_satuan'], kode_barang,))
            mysql.connection.commit()
            
            #Dokumentasi perubahan ke database
            activity = (f"(-) Pengurangan stok kaos polos dengan kode barang {kode_barang} yang berjumlah {kaos_polos['jumlah_stok']+1} ke {kaos_polos['jumlah_stok']}")
            cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
            mysql.connection.commit()
            
            #Dokumentasi Sales Record
            year = time.strftime("%Y")
            month = time.strftime("%m")
            cursor.execute(f'SELECT jumlah_pembelian FROM sales_tracking_kp WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{kode_barang}"')
            temp = cursor.fetchone()
            current_sales = temp['jumlah_pembelian']
            cursor.execute(f'UPDATE sales_tracking_kp SET jumlah_pembelian = {current_sales+1} WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{kode_barang}"')
            mysql.connection.commit()
            
            #Pengiriman notifikasi ke email jika stok habis
            if kaos_polos['jenis_kain'] == 'COTTON COMBED 20S' and kaos_polos['jumlah_stok'] == 0:
                if kaos_polos['warna'] == 'PUTIH' or kaos_polos['warna'] == 'HITAM':
                    cursor.execute('SELECT email FROM accounts WHERE username = "{0}" '.format(session['username']))
                    account = cursor.fetchone()
                    cursor.execute('SELECT email FROM accounts WHERE acc_type = "{0}" '.format('Admin'))
                    akun_penerima = cursor.fetchall()
                    for i in range(len(akun_penerima)):
                        temp = []
                        temp.append(akun_penerima[i]['email'])
                        msg = Message('Notifikasi Stok Barang - Sokou Lampung', sender = account['email'], recipients = temp)
                        msg.body = 'Hallo Admin Sokou Lampung. Informasi stok produk ' + kaos_polos['nama_barang'] +' dengan kode ' + kaos_polos['kode_barang'] + ' telah habis' + '\n\n' + 'Segera lakukan penambahan stok barang ya. Cukup hati yang kosong tanpa doi, stok produk jangan :)'
                        mail.send(msg)
                        temp.pop()
        
        return redirect(url_for('kaos_polos'))
    
    return redirect (url_for('login'))

@app.route('/kaos_polos_inc/<kode_barang>', methods=['POST', 'GET'])
def kaos_polos_inc(kode_barang):
    # Check if user is loggedin
    if 'loggedin' in session:
        #Penambahan stok kaos polos
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM kaos_polos where kode_barang = %s', (kode_barang,))
        kaos_polos = cursor.fetchone()
        cursor.execute('UPDATE kaos_polos SET jumlah_stok = %s WHERE kode_barang = %s', (kaos_polos['jumlah_stok']+1, kode_barang,))
        mysql.connection.commit()
        
        #Pembaruan total harga kaos polos
        cursor.execute('SELECT * FROM kaos_polos where kode_barang = %s', (kode_barang,))
        kaos_polos = cursor.fetchone()
        cursor.execute('UPDATE kaos_polos SET total_harga = %s WHERE kode_barang = %s', (kaos_polos['jumlah_stok']*kaos_polos['harga_satuan'], kode_barang,))
        mysql.connection.commit()
        
        #Dokumentasi perubahan ke database
        activity = (f"(+) Penambahan stok kaos polos dengan kode barang {kode_barang} yang berjumlah {kaos_polos['jumlah_stok']-1} ke {kaos_polos['jumlah_stok']}")
        cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
        mysql.connection.commit()
        
        #Pengiriman notifikasi ke email jika stok habis
        if kaos_polos['jenis_kain'] == 'COTTON COMBED 20S' and kaos_polos['jumlah_stok'] == 0:
            if kaos_polos['warna'] == 'PUTIH' or kaos_polos['warna'] == 'HITAM':
                cursor.execute('SELECT email FROM accounts WHERE username = "{0}" '.format(session['username']))
                account = cursor.fetchone()
                cursor.execute('SELECT email FROM accounts WHERE acc_type = "{0}" '.format('Admin'))
                akun_penerima = cursor.fetchall()
                for i in range(len(akun_penerima)):
                    temp = []
                    temp.append(akun_penerima[i]['email'])
                    msg = Message('Notifikasi Stok Barang - Sokou Lampung', sender = account['email'], recipients = temp)
                    msg.body = 'Hallo Admin Sokou Lampung. Informasi stok produk ' + kaos_polos['nama_barang'] +' dengan kode ' + kaos_polos['kode_barang'] + ' telah habis' + '\n\n' + 'Segera lakukan penambahan stok barang ya. Cukup hati yang kosong tanpa doi, stok produk jangan :)'
                    mail.send(msg)
                    temp.pop()

        return redirect(url_for('kaos_polos'))
    return redirect (url_for('login'))

@app.route('/kaos_polos_del/<kode_barang>', methods=['POST', 'GET'])
def kaos_polos_del(kode_barang):
    # Check if user is loggedin
    if 'loggedin' in session:
        #Penghapusan stok kaos polos
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('DELETE FROM kaos_polos WHERE kode_barang = %s', (kode_barang,))
        mysql.connection.commit()
        
        #Dokumentasi perubahan ke database
        activity = (f"(DEL) Penghapusan stok kaos polos dengan kode barang {kode_barang}")
        cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
        mysql.connection.commit()
        
        return redirect(url_for('kaos_polos'))
    return redirect (url_for('login'))

@app.route('/kaos_polos_edit/<kode_barang>', methods=['POST', 'GET'])
def kaos_polos_edit(kode_barang):
    # Check if user is loggedin
    if 'loggedin' in session and session['acc_type'] == 'Admin':
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        if request.method == 'POST':
            kode_barang_changed = False
            
            if 'kode_barang' in request.form and not request.form['kode_barang'] == '':
                if request.form['kode_barang'] != kode_barang:
                # Create variables for easy access
                    new_kode_barang = request.form['kode_barang']
                    try:
                        cursor.execute('UPDATE kaos_polos SET kode_barang = %s WHERE kode_barang = %s', (new_kode_barang, kode_barang,))
                        mysql.connection.commit()
                        kode_barang_changed = True
                        
                        #Dokumentasi perubahan ke database
                        activity = (f"(EDIT) Pengeditan kode barang {kode_barang} menjadi {new_kode_barang} pada stok kaos polos")
                        cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                        mysql.connection.commit()
                        
                    except:
                        cursor.execute('UPDATE IGNORE kaos_polos SET kode_barang = %s WHERE kode_barang = %s', (new_kode_barang, kode_barang,))
                        mysql.connection.commit()
                        
            if kode_barang_changed:
                kode_barang = new_kode_barang
                
            cursor.execute('SELECT * FROM kaos_polos WHERE kode_barang = %s', (kode_barang,))
            kaos_polos = cursor.fetchone()
                
            if 'nama_barang' in request.form and not request.form['nama_barang'] == '':
                if request.form['nama_barang'] != kaos_polos['nama_barang']:
                    # Create variables for easy access
                    new_nama_barang = request.form['nama_barang']
                    cursor.execute('UPDATE kaos_polos SET nama_barang = %s WHERE kode_barang = %s', (new_nama_barang, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan nama barang dengan kode barang {kode_barang} dari {kaos_polos['nama_barang']} menjadi {new_nama_barang} pada stok kaos polos")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
            
            if 'size' in request.form and not request.form['size'] == '':
                if request.form['size'] != kaos_polos['size']:
                    # Create variables for easy access
                    new_size = request.form['size']
                    cursor.execute('UPDATE kaos_polos SET size = %s WHERE kode_barang = %s', (new_size, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan size dengan kode barang {kode_barang} dari {kaos_polos['size']} menjadi {new_size} pada stok kaos polos")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
            
            
            if 'jenis_kain' in request.form and not request.form['jenis_kain'] == '':
                if request.form['jenis_kain'] != kaos_polos['jenis_kain']:
                    # Create variables for easy access
                    new_jenis_kain = request.form['jenis_kain']
                    cursor.execute('UPDATE kaos_polos SET jenis_kain = %s WHERE kode_barang = %s', (new_jenis_kain, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan jenis kain dengan kode barang {kode_barang} dari {kaos_polos['jenis_kain']} menjadi {new_jenis_kain} pada stok kaos polos")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
            
                    
            if 'bentuk_lengan' in request.form and not request.form['bentuk_lengan'] == '':
                if request.form['bentuk_lengan'] != kaos_polos['bentuk_lengan']:
                    # Create variables for easy access
                    new_bentuk_lengan = request.form['bentuk_lengan']
                    cursor.execute('UPDATE kaos_polos SET bentuk_lengan = %s WHERE kode_barang = %s', (new_bentuk_lengan, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan bentuk lengan dengan kode barang {kode_barang} dari {kaos_polos['bentuk_lengan']} menjadi {new_bentuk_lengan} pada stok kaos polos")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
            
            
            if 'bentuk_lingkar_leher' in request.form and not request.form['bentuk_lingkar_leher'] == '':
                if request.form['bentuk_lingkar_leher'] != kaos_polos['bentuk_lingkar_leher']:
                    # Create variables for easy access
                    new_bentuk_lingkar_leher = request.form['bentuk_lingkar_leher']
                    cursor.execute('UPDATE kaos_polos SET bentuk_lingkar_leher = %s WHERE kode_barang = %s', (new_bentuk_lingkar_leher, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan bentuk lingkar leher dengan kode barang {kode_barang} dari {kaos_polos['bentuk_lingkar_leher']} menjadi {new_bentuk_lingkar_leher} pada stok kaos polos")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
            
            
            if 'warna' in request.form and not request.form['warna'] == '':
                if not request.form['warna'] == kaos_polos['warna']:
                    # Create variables for easy access
                    new_warna = request.form['warna']
                    cursor.execute('UPDATE kaos_polos SET warna = %s WHERE kode_barang = %s', (new_warna, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan warna dengan kode barang {kode_barang} dari {kaos_polos['warna']} menjadi {new_warna} pada stok kaos polos")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
            
            
            if 'jumlah_stok' in request.form and not request.form['jumlah_stok'] == '':
                if not int(request.form['jumlah_stok']) == kaos_polos['jumlah_stok']:
                    # Create variables for easy access
                    new_jumlah_stok = request.form['jumlah_stok']
                    cursor.execute('UPDATE kaos_polos SET jumlah_stok = %s WHERE kode_barang = %s', (new_jumlah_stok, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan jumlah stok dengan kode barang {kode_barang} dari {kaos_polos['jumlah_stok']} menjadi {new_jumlah_stok} pada stok kaos polos")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
                    
                    if kaos_polos['jumlah_stok'] > int(new_jumlah_stok):
                        #Dokumentasi Sales Record
                        year = time.strftime("%Y")
                        month = time.strftime("%m")
                        cursor.execute(f'SELECT jumlah_pembelian FROM sales_tracking_kp WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{kode_barang}"')
                        temp = cursor.fetchone()
                        current_sales = temp['jumlah_pembelian']
                        jumlah_pembelian = current_sales + (kaos_polos['jumlah_stok'] - int(new_jumlah_stok))
                        cursor.execute(f'UPDATE sales_tracking_kp SET jumlah_pembelian = {jumlah_pembelian} WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{kode_barang}"')
                        mysql.connection.commit()
            
            if 'harga_satuan' in request.form and not request.form['harga_satuan'] == '':
                if int(request.form['harga_satuan']) != kaos_polos['harga_satuan']:
                    # Create variables for easy access
                    new_harga_satuan = request.form['harga_satuan']
                    cursor.execute('UPDATE kaos_polos SET harga_satuan = %s WHERE kode_barang = %s', (new_harga_satuan, kode_barang,))
                    mysql.connection.commit()
                    cursor.execute('SELECT jumlah_stok FROM kaos_polos WHERE kode_barang = "{0}" '.format(kode_barang))
                    jumlah_stok = cursor.fetchone()
                    new_harga_total = int(new_harga_satuan) * int(jumlah_stok['jumlah_stok'])
                    cursor.execute('UPDATE kaos_polos SET total_harga = %s WHERE kode_barang = %s', (new_harga_total, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan harga satuan dengan kode barang {kode_barang} dari Rp.{kaos_polos['harga_satuan']} menjadi Rp.{new_harga_satuan} pada stok kaos polos")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
            
                    
            return redirect(url_for('kaos_polos'))
        
        elif request.method == 'GET':
            cursor.execute('SELECT * FROM kaos_polos WHERE kode_barang = "{0}" '.format(kode_barang))
            kaosPolos = cursor.fetchone()
            return render_template('Edit.Kaos.Polos.html', kaos_polos = kaosPolos)
    # User is not loggedin redirect to login page
    return redirect (url_for('login'))

@app.route('/kaos_polos_add', methods=['POST', 'GET'])
def kaos_polos_add():
    if 'loggedin' in session and session['acc_type'] == 'Admin':
        if request.method == 'GET':
            return render_template('Tambah.Kaos.Polos.html', username=session['username'],)
        elif request.method == 'POST':
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            # Create variables for easy access
            kode_barang = request.form['kode_barang']
            nama_barang = request.form['nama_barang']
            size = request.form['size']
            jenis_kain = request.form['jenis_kain']
            bentuk_lengan = request.form['bentuk_lengan']
            bentuk_lingkar_leher = request.form['bentuk_lingkar_leher']
            warna = request.form['warna']
            jumlah_stok = request.form['jumlah_stok']
            harga_satuan = request.form['harga_satuan']
            total_harga = int(harga_satuan) * int(jumlah_stok)
            # Check if account exists using MySQL
            cursor.execute('SELECT kode_barang FROM kaos_polos WHERE kode_barang = "{0}" '.format(kode_barang))
            # Fetch one record and return result
            old_kaos_polos = cursor.fetchone()
            if not old_kaos_polos:
                cursor.execute('INSERT INTO kaos_polos (kode_barang, nama_barang, size, jenis_kain, bentuk_lengan, bentuk_lingkar_leher, warna, jumlah_stok, harga_satuan, total_harga) VALUES ("{0}", "{1}", "{2}", "{3}", "{4}", "{5}", "{6}", "{7}", "{8}", "{9}")'.format(kode_barang, nama_barang, size, jenis_kain, bentuk_lengan, bentuk_lingkar_leher, warna, jumlah_stok, harga_satuan, total_harga))
                mysql.connection.commit()
                
                #Dokumentasi perubahan ke database
                activity = (f"(ADD) Penambahan stok kaos polos {nama_barang} dengan kode barang {kode_barang}")
                cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                mysql.connection.commit()
                
                return redirect(url_for('kaos_polos'))
                
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))
                          
@app.route('/kaos_polos_export', methods=['POST', 'GET'])
def kaos_polos_export():
    if 'loggedin' in session:
        df=psql.read_sql('SELECT * FROM kaos_polos ORDER BY kode_barang ASC', con=mysql.connection)
        df.to_excel('./data_export/kaos_polos.xlsx', index=False)
        return send_file("./data_export/kaos_polos.xlsx", as_attachment=True)
    if 'loggedin' in session:
        return redirect(url_for('kaos_polos'))
    else:
        return redirect(url_for('login'))
            
@app.route('/kaos_original', methods=['POST', 'GET'])
def kaos_original():
    #check if user is loggedin
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM kaos_original ORDER BY kode_barang ASC')
        data_kaos_original = cursor.fetchall()
        #user is loggedin show them the home page
        if session['acc_type'] == 'Staff':
            return render_template('Kaos.Original.html', username=session['username'], data_kaos_original=data_kaos_original)
        elif session['acc_type'] == 'Admin':
            return render_template('Kaos.Original.Admin.html', username=session['username'], data_kaos_original=data_kaos_original)
        return redirect(url_for('kaos_original'))
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

@app.route('/kaos_original_dec/<kode_barang>', methods=['POST', 'GET'])
def kaos_original_dec(kode_barang):
    # Check if user is loggedin
    if 'loggedin' in session:
        #Kaos polos data retrieval
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT jumlah_stok FROM kaos_original where kode_barang = %s', (kode_barang,))
        kaos_original = cursor.fetchone()
        if not kaos_original['jumlah_stok']-1 == -1:
            #Pengurangan stok kaos original
            cursor.execute('UPDATE kaos_original SET jumlah_stok = %s WHERE kode_barang = %s', (kaos_original['jumlah_stok']-1, kode_barang,))
            mysql.connection.commit()
        
            #Pembaruan total harga kaos original
            cursor.execute('SELECT * FROM kaos_original where kode_barang = %s', (kode_barang,))
            kaos_original = cursor.fetchone()
            cursor.execute('UPDATE kaos_original SET total_harga = %s WHERE kode_barang = %s', (kaos_original['jumlah_stok']*kaos_original['harga_satuan'], kode_barang,))
            mysql.connection.commit()
            
            #Dokumentasi perubahan ke database
            activity = (f"(-) Pengurangan stok kaos original dengan kode barang {kode_barang} yang berjumlah {kaos_original['jumlah_stok']+1} ke {kaos_original['jumlah_stok']}")
            cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
            mysql.connection.commit()
            
            #Dokumentasi Sales Record
            year = time.strftime("%Y")
            month = time.strftime("%m")
            cursor.execute(f'SELECT jumlah_pembelian FROM sales_tracking_ko WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{kode_barang}"')
            temp = cursor.fetchone()
            current_sales = temp['jumlah_pembelian']
            cursor.execute(f'UPDATE sales_tracking_ko SET jumlah_pembelian = {current_sales+1} WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{kode_barang}"')
            mysql.connection.commit()
        
        return redirect(url_for('kaos_original'))
    return redirect (url_for('login'))

@app.route('/kaos_original_inc/<kode_barang>', methods=['POST', 'GET'])
def kaos_original_inc(kode_barang):
    # Check if user is loggedin
    if 'loggedin' in session:
        #Penambahan stok kaos original
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT jumlah_stok FROM kaos_original where kode_barang = %s', (kode_barang,))
        kaos_original = cursor.fetchone()
        cursor.execute('UPDATE kaos_original SET jumlah_stok = %s WHERE kode_barang = %s', (kaos_original['jumlah_stok']+1, kode_barang,))
        mysql.connection.commit()
        
        #Pembaruan total harga kaos original
        cursor.execute('SELECT * FROM kaos_original where kode_barang = %s', (kode_barang,))
        kaos_original = cursor.fetchone()
        cursor.execute('UPDATE kaos_original SET total_harga = %s WHERE kode_barang = %s', (kaos_original['jumlah_stok']*kaos_original['harga_satuan'], kode_barang,))
        mysql.connection.commit()
        
        #Dokumentasi perubahan ke database
        activity = (f"(+) Penambahan stok kaos original dengan kode barang {kode_barang} yang berjumlah {kaos_original['jumlah_stok']-1} ke {kaos_original['jumlah_stok']}")
        cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
        mysql.connection.commit()
        
        return redirect(url_for('kaos_original'))
    return redirect (url_for('login'))

@app.route('/kaos_original_del/<kode_barang>', methods=['POST', 'GET'])
def kaos_original_del(kode_barang):
    # Check if user is loggedin
    if 'loggedin' in session:
        #Penambahan stok kaos original
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('DELETE FROM kaos_original WHERE kode_barang = %s', (kode_barang,))
        mysql.connection.commit()
        
        #Dokumentasi perubahan ke database
        activity = (f"(DEL) Penghapusan stok kaos original dengan kode barang {kode_barang}")
        cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
        mysql.connection.commit()
        
        return redirect(url_for('kaos_original'))
    return redirect (url_for('login'))

@app.route('/kaos_original_edit/<kode_barang>', methods=['POST', 'GET'])
def kaos_original_edit(kode_barang):
    # Check if user is loggedin
    if 'loggedin' in session and session['acc_type'] == 'Admin':
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        if request.method == 'POST':
            kode_barang_changed = False
            
            if 'kode_barang' in request.form and not request.form['kode_barang'] == '':
                if request.form['kode_barang'] != kode_barang:
                    # Create variables for easy access
                    new_kode_barang = request.form['kode_barang']
                    try:
                        cursor.execute('UPDATE kaos_original SET kode_barang = %s WHERE kode_barang = %s', (new_kode_barang, kode_barang,))
                        mysql.connection.commit()
                        kode_barang_changed = True
                        
                        #Dokumentasi perubahan ke database
                        activity = (f"(EDIT) Pengeditan kode barang {kode_barang} menjadi {new_kode_barang} pada stok kaos original")
                        cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                        mysql.connection.commit()
                        
                    except:
                        cursor.execute('UPDATE IGNORE kaos_original SET kode_barang = %s WHERE kode_barang = %s', (new_kode_barang, kode_barang,))
                        mysql.connection.commit()
                        
            if kode_barang_changed:
                kode_barang = new_kode_barang
                
            cursor.execute('SELECT * FROM kaos_original WHERE kode_barang = %s', (kode_barang,))
            kaos_original = cursor.fetchone()
                
            if 'nama_barang' in request.form and not request.form['nama_barang'] == '':
                if request.form['nama_barang'] != kaos_original['nama_barang']:
                    # Create variables for easy access
                    new_nama_barang = request.form['nama_barang']
                    cursor.execute('UPDATE kaos_original SET nama_barang = %s WHERE kode_barang = %s', (new_nama_barang, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan nama barang dengan kode barang {kode_barang} dari {kaos_original['nama_barang']} menjadi {new_nama_barang} pada stok kaos original")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
            
            if 'size' in request.form and not request.form['size'] == '':
                if request.form['size'] != kaos_original['size']:
                    # Create variables for easy access
                    new_size = request.form['size']
                    cursor.execute('UPDATE kaos_original SET size = %s WHERE kode_barang = %s', (new_size, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan size dengan kode barang {kode_barang} dari {kaos_original['size']} menjadi {new_size} pada stok kaos original")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
                    
            if 'bentuk_lengan' in request.form and not request.form['bentuk_lengan'] == '':
                if request.form['bentuk_lengan'] != kaos_original['bentuk_lengan']:
                    # Create variables for easy access
                    new_bentuk_lengan = request.form['bentuk_lengan']
                    cursor.execute('UPDATE kaos_original SET bentuk_lengan = %s WHERE kode_barang = %s', (new_bentuk_lengan, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan bentuk lengan dengan kode barang {kode_barang} dari {kaos_original['bentuk_lengan']} menjadi {new_bentuk_lengan} pada stok kaos original")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
            
            if 'desain' in request.form and not request.form['desain'] == '':
                if request.form['desain'] != kaos_original['desain']:
                    # Create variables for easy access
                    new_desain = request.form['desain']
                    cursor.execute('UPDATE kaos_original SET desain = %s WHERE kode_barang = %s', (new_desain, kode_barang,))
                    mysql.connection.commit()

                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan desain dengan kode barang {kode_barang} dari {kaos_original['desain']} menjadi {new_desain} pada stok kaos original")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
            
                    
            if 'warna' in request.form and not request.form['warna'] == '':
                if request.form['warna'] != kaos_original['warna']:
                    # Create variables for easy access
                    new_warna = request.form['warna']
                    cursor.execute('UPDATE kaos_original SET warna = %s WHERE kode_barang = %s', (new_warna, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan warna dengan kode barang {kode_barang} dari {kaos_original['warna']} menjadi {new_warna} pada stok kaos original")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
            
            if 'jumlah_stok' in request.form and not request.form['jumlah_stok'] == '':
                if int(request.form['jumlah_stok']) != kaos_original['jumlah_stok']:
                    # Create variables for easy access
                    new_jumlah_stok = request.form['jumlah_stok']
                    cursor.execute('UPDATE kaos_original SET jumlah_stok = %s WHERE kode_barang = %s', (new_jumlah_stok, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan jumlah stok dengan kode barang {kode_barang} dari {kaos_original['jumlah_stok']} menjadi {new_jumlah_stok} pada stok kaos original")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
                    
                    if kaos_original['jumlah_stok'] > int(new_jumlah_stok):
                        #Dokumentasi Sales Record
                        year = time.strftime("%Y")
                        month = time.strftime("%m")
                        cursor.execute(f'SELECT jumlah_pembelian FROM sales_tracking_ko WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{kode_barang}"')
                        temp = cursor.fetchone()
                        current_sales = temp['jumlah_pembelian']
                        jumlah_pembelian = current_sales + (kaos_original['jumlah_stok'] - int(new_jumlah_stok))
                        cursor.execute(f'UPDATE sales_tracking_ko SET jumlah_pembelian = {jumlah_pembelian} WHERE bulan = {month} AND tahun = {year} AND kode_barang = "{kode_barang}"')
                        mysql.connection.commit()
            
            if 'harga_satuan' in request.form and not request.form['harga_satuan'] == '':
                if int(request.form['harga_satuan']) != kaos_original['harga_satuan']:
                    # Create variables for easy access
                    new_harga_satuan = request.form['harga_satuan']
                    cursor.execute('UPDATE kaos_original SET harga_satuan = %s WHERE kode_barang = %s', (new_harga_satuan, kode_barang,))
                    mysql.connection.commit()
                    cursor.execute('SELECT jumlah_stok FROM kaos_original WHERE kode_barang = "{0}" '.format(kode_barang))
                    jumlah_stok = cursor.fetchone()
                    new_harga_total = int(new_harga_satuan) * int(jumlah_stok['jumlah_stok'])
                    cursor.execute('UPDATE kaos_original SET total_harga = %s WHERE kode_barang = %s', (new_harga_total, kode_barang,))
                    mysql.connection.commit()
                    
                    #Dokumentasi perubahan ke database
                    activity = (f"(EDIT) Pengeditan harga satuan dengan kode barang {kode_barang} dari Rp.{kaos_original['harga_satuan']} menjadi Rp.{new_harga_satuan} pada stok kaos original")
                    cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                    mysql.connection.commit()
                    
            return redirect(url_for('kaos_original'))
        
        elif request.method == 'GET':
            cursor.execute('SELECT * FROM kaos_original WHERE kode_barang = "{0}" '.format(kode_barang))
            kaosOriginal = cursor.fetchone()
            return render_template('Edit.Kaos.Original.html', kaos_original = kaosOriginal)
    # User is not loggedin redirect to login page
    return redirect (url_for('login'))

@app.route('/kaos_original_add', methods=['POST', 'GET'])
def kaos_original_add():
    if 'loggedin' in session and session['acc_type'] == 'Admin':
        if request.method == 'GET':
            return render_template('Tambah.Kaos.Original.html', username=session['username'],)
        elif request.method == 'POST':
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            # Create variables for easy access
            kode_barang = request.form['kode_barang']
            nama_barang = request.form['nama_barang']
            size = request.form['size']
            bentuk_lengan = request.form['bentuk_lengan']
            desain = request.form['desain']
            warna = request.form['warna']
            jumlah_stok = request.form['jumlah_stok']
            harga_satuan = request.form['harga_satuan']
            total_harga = int(harga_satuan) * int(jumlah_stok)
            # Check if account exists using MySQL
            cursor.execute('SELECT kode_barang FROM kaos_original WHERE kode_barang = "{0}" '.format(kode_barang))
            # Fetch one record and return result
            old_kaos_original = cursor.fetchone()
            if not old_kaos_original:
                cursor.execute('INSERT INTO kaos_original (kode_barang, nama_barang, size, bentuk_lengan, desain, warna, jumlah_stok, harga_satuan, total_harga) VALUES ("{0}", "{1}", "{2}", "{3}", "{4}", "{5}", "{6}", "{7}", "{8}")'.format(kode_barang, nama_barang, size, bentuk_lengan, desain, warna, jumlah_stok, harga_satuan, total_harga))
                mysql.connection.commit()
                
                #Dokumentasi perubahan ke database
                activity = (f"(ADD) Penambahan stok kaos original {nama_barang} dengan kode barang {kode_barang}")
                cursor.execute('INSERT INTO update_history (activity, time, user) VALUES (%s, %s, %s)', (activity, datetime.now() ,session['username'],))
                mysql.connection.commit()
                
                return redirect(url_for('kaos_original'))
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))
        
@app.route('/kaos_original_export', methods=['POST', 'GET'])
def kaos_original_export():
    if 'loggedin' in session:
        df=psql.read_sql('SELECT * FROM kaos_original ORDER BY kode_barang ASC', con=mysql.connection)
        df.to_excel('./data_export/kaos_original.xlsx', index=False)
        return send_file("./data_export/kaos_original.xlsx", as_attachment=True)
    if 'loggedin' in session:
        return redirect(url_for('kaos_original'))
    else:
        return redirect(url_for('login'))
    
@app.route('/history_update', methods=['POST', 'GET'])
def history_update():
    #check if user is loggedin
    if 'loggedin' in session:
        #user is loggedin show them the home page
        if session['acc_type'] == 'Admin':
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM update_history ORDER BY id DESC')
            update_history = cursor.fetchall()
            return render_template('Histori.Update.html',update_history=update_history )
        return redirect(url_for('home'))
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))
        
@app.route('/manajemen_akun', methods=['POST', 'GET'])
def manajemen_akun():
    #check if user is loggedin
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM accounts ORDER BY acc_type ASC')
        accounts = cursor.fetchall()
        #user is loggedin show them the home page
        if session['acc_type'] == 'Admin':
            return render_template('Manajemen.Akun.html', username=session['username'], accounts=accounts)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

@app.route('/manajemen_akun_del/<username>', methods=['POST', 'GET'])
def manajemen_akun_del(username):
    # Check if user is loggedin
    if 'loggedin' in session and session['acc_type'] == 'Admin':
        #Penambahan stok kaos original
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('DELETE FROM accounts WHERE username = %s', (username,))
        mysql.connection.commit()
        return redirect(url_for('manajemen_akun'))
    return redirect (url_for('login'))
        
@app.route('/manajemen_akun_edit/<username>', methods=['POST', 'GET'])
def manajemen_akun_edit(username):
    if 'loggedin' in session and session['acc_type'] == 'Admin':
        msg =''
        if request.method == 'POST':
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            if 'username' in request.form:
                if not request.form['username'] == '':
                    # Create variables for easy access
                    new_username = request.form['username']
                    cursor.execute('UPDATE IGNORE accounts SET username = %s WHERE username = %s', (new_username, username,))
                    mysql.connection.commit()
                    if session['username'] == username:
                        session['username'] = new_username
            if 'email' in request.form:
                if not request.form['email'] == '':
                    # Create variables for easy access
                    new_email = request.form['email']
                    cursor.execute('UPDATE accounts SET email = %s WHERE username = %s', (new_email, username,))
                    mysql.connection.commit()
            if 'acc_type' in request.form:
                if not request.form['acc_type'] == '':
                    # Create variables for easy access
                    new_acc_type = request.form['acc_type']
                    cursor.execute('UPDATE accounts SET acc_type = %s WHERE username = %s', (new_acc_type, username,))
                    mysql.connection.commit()
                    if session['acc_type'] == 'Admin' and session['username'] == username:
                        session['acc_type'] = new_acc_type
            if 'password' in request.form:
                if not request.form['password'] == '':
                    # Create variables for easy access
                    new_password = request.form['password']
                    cursor.execute('UPDATE accounts SET password = %s WHERE username = %s', (new_password, username,))
                    mysql.connection.commit()
                
        elif request.method == 'GET':
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM accounts WHERE username = "{0}" '.format(username))
            account = cursor.fetchone()
            user_photo=account['user_photo']
            return render_template('Edit.Manajemen.Akun.html', account=account, msg=msg, user_photo=user_photo)
    # User is not loggedin redirect to login page
    return redirect(url_for('manajemen_akun'))

@app.route('/tambah_akun', methods=['POST', 'GET'])
def tambah_akun():
    if 'loggedin' in session and session['acc_type'] == 'Admin':
        msg =''
        if request.method == 'GET':
            return render_template('Tambah.Manajemen.Akun.html', username=session['username'], msg=msg)
        elif request.method == 'POST':
            # Create variables for easy access
            username = request.form['username']
            password = request.form['password']
            acc_type = request.form['acc_type']
            email = request.form['email']
            # Check if account exists using MySQL
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT username FROM accounts WHERE username = "{0}" '.format(username))
            # Fetch one record and return result
            account = cursor.fetchone()
            if not account:
                cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
                cursor.execute('INSERT INTO accounts (username, password, acc_type, email) VALUES ("{0}", "{1}", "{2}", "{3}")'.format(username, password, acc_type, email))
                mysql.connection.commit()
                return redirect(url_for('manajemen_akun'))
            else:
                # Account doesnt exist or username/password incorrect
                msg = 'Username sudah digunakan'
                # Show the login form with message (if any)
                return render_template('Tambah.Manajemen.Akun.html', msg=msg)
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
    app.run(host='0.0.0.0', port=500, debug=True)
    # print(graph_data_retreval())