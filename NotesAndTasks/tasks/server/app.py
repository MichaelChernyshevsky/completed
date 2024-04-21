from flask import Flask
from flask_sqlalchemy import SQLAlchemy


def create_app()-> Flask:
    app = Flask(__name__)
    app.config[
        "SQLALCHEMY_DATABASE_URI"
    ] = "postgresql://localhost:6000/postgres"
    app.app_context().push()
    return app

app = create_app()
db = SQLAlchemy(app)