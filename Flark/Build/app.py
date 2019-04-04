from flask import Flask
from flask import request
import subprocess
app = Flask(__name__)

@app.route("/",methods = ['POST', 'GET'])
def form():
    if request.method == 'POST': #this block is only entered when the form is submitted
        sparkinput = request.form.get('sparkinput')
        nodes = request.form.get('nodes')
        example = request.form.get('example')
        command = ['sh','run-spark-test.sh',nodes,example,sparkinput]
        process = subprocess.Popen(command, stdout = subprocess.PIPE)
        print("Running")
        output, err = process.communicate()
        return output

    return '''<form method="POST">
                  Number of Nodes: <input type="text" name="nodes"><br>
                  Spark Example: <input type="text" name='example"><br>
                  Spark Input: <input type="text" name="sparkinput"><br>
                  <input type="submit" value="Submit"><br>
              </form>'''

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')
