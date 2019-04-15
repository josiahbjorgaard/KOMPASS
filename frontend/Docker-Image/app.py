#KOMPASS front-end

from flask import Flask
from flask import Response
from flask import request,render_template
from prometheus_flask_exporter import PrometheusMetrics
import subprocess

app = Flask(__name__)
metrics = PrometheusMetrics(app)

metrics.info('app_info', 'Application info', version='1.0.3')

@app.route("/run",methods = ['GET'])
def form():
    if request.method == 'GET': #this block is only entered when the form is submitted
        #request.form.get would come from post data, change request.method to 'POST' and fomr method to "POST'
        sparkinput = request.args.get('input','10')
        nodes = request.args.get('nodes','5')
        example = request.args.get('example','SparkPi')
        command = ['sh','run-spark-test.sh',nodes,example,sparkinput]
        p = subprocess.Popen(command,stdout = subprocess.PIPE, bufsize=1)
        def inner():
            for line in iter(p.stdout.readline,''):
                yield line.rstrip() + '<br/>\n'
        return Response(inner(), mimetype='text/html')

if __name__ == '__main__':
    app.run(host='0.0.0.0')
