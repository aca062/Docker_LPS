import flask
from flask import request, jsonify
import mysql.connector
import json

app = flask.Flask(__name__)
app.config["DEBUG"] = True

@app.route('/login', methods=['GET'])
def check_grades():
    if 'usuario' and 'contrasena' in request.args:
        usuario = request.args.get('usuario')
        contrasena = request.args.get('contrasena')
    else:
        return "No se ha introducido usuario o contraseña."
    config = {
        'user': 'user',
        'password': 'user',
        'host': 'db',
        'port': '3306',
        'database': 'lps_trabajo'
    }
    connection = mysql.connector.connect(**config)
    cursor = connection.cursor()
    query = ("""SELECT `alumnos_id_alum`,`asignatura`,`parcial_1`,`parcial_2`,`final`,`alumnos`.`nombre` as "nombre_alumno",`profesores`.`nombre` as "nombre_profesor" FROM `profesor_has_alumno` JOIN `alumnos` ON `profesor_has_alumno`.`alumnos_id_alum` = `alumnos`.`id_alum` JOIN `profesores` ON `profesor_has_alumno`.`profesores_id_prof` = `profesores`.`id_prof` WHERE `usuario_prof` = %s AND `pass_prof` = %s ORDER BY `profesor_has_alumno`.`profesores_id_prof` ASC;""")
    tupla = (usuario, contrasena)
    cursor.execute(query, tupla)
    row_headers=[x[0] for x in cursor.description]
    rv = cursor.fetchall()
    json_data=[]
    for result in rv:
        json_data.append(dict(zip(row_headers,result)))
    return json.dumps(json_data)



@app.route('/', methods=['GET'])
def home():
    return '''<h1>Sistema de notas de la Universidad de Murcia</h1>
                <p>Sistema de notas de los profesores.</p>'''

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)
