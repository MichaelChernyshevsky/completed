from app import db

class Folder(db.Model):
    __tablename__ = "notes_folders"
    __table_args__ = {"extend_existing": True}

    id = db.Column("id", db.Integer, primary_key=True)
    type = db.Column("type", db.String(200))

    def __init__(self,type):
        self.type = type

   
        
    @staticmethod
    def addFolder(title):
        folder = Folder(
            type=title
        )
        db.session.add(folder)
        db.session.commit()
    @staticmethod
    def deleteFolder(id):
            folder = Folder.query.filter_by(id=id).first()
            db.session.delete(folder)
            db.session.commit()
           
           
      
             

    @staticmethod
    def getFolders():
            json_events = []
            events = Folder.query.all()
            for event in events:
                form = {
                    "id" : event.__dict__['id'],
                    "title" : event.__dict__['type'],
                } 
                json_events.append(form)
            return json_events
      