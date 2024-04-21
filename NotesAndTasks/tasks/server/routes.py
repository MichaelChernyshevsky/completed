

from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from app import app

from servers.tasks.service.services.user_service import *




#user 
@app.post('/user/registartion')
def registration():
    _email = request.json["email"]
    return jsonify(getIdUser(email=_email));

@app.get('/user/signin')
def signIn():
    _email = request.json["email"]
    return jsonify(getIdUser(email=_email));


@app.delete('/user/delete')
def deleteAccount():
    _id = request.json["id"]
    return jsonify(deleteUser(id= _id));


if __name__ == "__main__":
    app.run(debug=True,port=5001)
