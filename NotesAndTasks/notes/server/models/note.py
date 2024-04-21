from app import db

class Note(db.Model):
    __tablename__ = "notes"
    __table_args__ = {"extend_existing": True}

    id = db.Column("id", db.Integer, primary_key=True)
    title = db.Column("title", db.String(100))
    description = db.Column("description", db.String(100))
    id_folder = db.Column("id_folder", db.Integer )



    def __init__(self,title,description,id_folder):
        self.description = description
        self.title = title
        self.id_folder = id_folder
        

        
    @staticmethod
    def getNotes():
        try:
            json_events = []
            events = Note.query.all()
            for event in events:
                form = {
                    "id" : event.__dict__['id'],
                    "title" : event.__dict__['title'],
                    "description" : event.__dict__['description'],
                    "id_folder" : event.__dict__['id_folder'],
                } 
                json_events.append(form)
            return json_events
        except:
            return 500
    @staticmethod
    def addNote(description,title,id_folder):
        note = Note(
            title=title,
            description=description,
            id_folder=id_folder,
        )
        db.session.add(note)
        db.session.commit()
    @staticmethod
    def deleteNote(id):
        note = Note.query.filter_by(id=id).first()
        db.session.delete(note)
        db.session.commit()
