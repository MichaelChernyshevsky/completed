from model.user import User
from servers.tasks.service.services.app import db


@staticmethod
def registrationUser(email:str):
    _user = User(
          email=email
    ) 
    db.session.add(_user)
    db.session.commit()

@staticmethod
def getIdUser(email:str):
    id = User.query.filter_by(id=id).first()

@staticmethod
def deleteUser(id):
    _user = User.query.filter_by(id=id).first()
    db.session.delete(_user)
    db.session.commit()
           