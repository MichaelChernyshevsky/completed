from servers.tasks.model.colours import db

class User(db.Model):
    __tablename__ = "tasks_users"
    __table_args__ = {"extend_existing": True}

    id = db.Column("id", db.Integer, primary_key=True)
    email = db.Column("title", db.String())
    

    def __init__(self,email):
        self.email = email
       