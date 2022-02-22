from flask import Flask,render_template,url_for, request,jsonify,session,flash
from werkzeug.utils import append_slash_redirect

app = Flask(__name__)

@app.route('/', methods=['POST', 'GET'])
def fucntion():
    if request.method == 'POST':
        pass
    else:
        return render_template('login-page.html')

if __name__ == "__main__": 
    app.run(host='hrfi', port=80, debug=True)