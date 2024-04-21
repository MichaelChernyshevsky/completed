from servers.tasks.model.colours import db

class Tasks(db.Model):
    __tablename__ = "SomeClass"
    __table_args__ = {"extend_existing": True}

    id = db.Column("id", db.Integer, primary_key=True)
    id_type = db.Column("id_type", db.Integer )
    type = db.Column("title", db.String())
    count = db.Column("count", db.Integer )
    start_day = db.Column("title", db.String())
    end_day = db.Column("title", db.String())

    def __init__(self,id_type,type,count,start_day,end_day):
        self.id_type = id_type
        self.type = type
        self.count = count
        self.start_day = start_day
        self.end_day = end_day

        