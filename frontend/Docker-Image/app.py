#KOMPASS front-end

from flask import Flask
from flask import Response
from flask import request,render_template
from prometheus_flask_exporter import PrometheusMetrics
import subprocess

app = Flask(__name__)
metrics = PrometheusMetrics(app)

@app.route("/",methods = ['GET'])
def form():
    if request.method == 'GET': #this block is only entered when the form is submitted
        #request.form.get would come from post data, change request.method to 'POST' and fomr method to "POST'
        sparkinput = request.args.get('input','10')
        nodes = request.args.get('nodes','5')
        example = request.args.get('example','SparkPi')
        command = ['sh','run-spark-test.sh',nodes,example,sparkinput]
        p = subprocess.Popen(command,stdout = subprocess.PIPE, bufsize=1)
        #output, err = p.communicate()
        #print output
        #Below prints line by line but sometimes doesn't finish
        #def generate(): 
        #    for line in iter(p.stdout.readline, b''):
        #        yield line
        #return Response(generate(),  mimetype='application/json')
        def inner():
        #    proc = subprocess.Popen(
        #        command,
        #        shell=True,
        #        stdout=subprocess.PIPE
        #        )
            for line in iter(p.stdout.readline,''):
                #sleep(0.1)
                yield line.rstrip() + '<br/>\n'

        return Response(inner(), mimetype='text/html')

        #return render_template('output.html',output=output)
#    return '''<form method="GET">
#                  Number of Nodes: <input type="text" name="nodes"><br>
#                  Spark Example: <input type="text" name="example"><br>
#                  Spark Input: <input type="text" name="sparkinput"><br>
#                  <input type="submit" value="Submit"><br>
#              </form>'''

if __name__ == '__main__':
#    app.run(debug=True,host='0.0.0.0')
#     app.run(threaded=True,host='0.0.0.0')
    app.run(host='0.0.0.0')
