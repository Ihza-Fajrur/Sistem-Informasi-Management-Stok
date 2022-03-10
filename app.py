from flask import Flask,render_template,url_for, request,jsonify,session,flash
from werkzeug.utils import append_slash_redirect
from flask_mail import Mail, Message

app = Flask(__name__)
mail= Mail(app)

app.config['MAIL_SERVER']='smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USERNAME'] = 'ihzafrh@gmail.com'
app.config['MAIL_PASSWORD'] = 'dolnvpurclfubzjo'
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True
mail = Mail(app)

@app.route('/', methods=['POST', 'GET'])
def fucntion():
    if request.method == 'POST':
        pass
    else:
        msg = Message('Hello', sender = 'ihzafrh@gmail.com', recipients = ['ihzafrh@gmail.com'])
        msg.body = "Hello Flask message sent from Flask-Mail"
        mail.send(msg)
        return render_template('login-page.html')

if __name__ == "__main__": 
    app.run(host='localhost', port=80, debug=True)