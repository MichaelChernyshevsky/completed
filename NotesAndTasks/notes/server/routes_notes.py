from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from app import app
from notes.models.note import Note
from notes.models.folder import Folder




# Notes
@app.get('/apps/folders')
def getFolders():
    return jsonify(Folder.getFolders());

@app.get('/apps/notes/notes')
def getNotes():
    return jsonify(Note.getNotes());


@app.post('/apps/notes/createFolder')
def addFolder():
    Folder.addFolder(
        request.json["title"]
    )
    return jsonify(Folder.getFolders());




@app.post('/apps/notes/create')
def addNote():
    Note.addNote(
        title= request.json["title"],
        id_folder= request.json["id_folder"],
        description= request.json["description"]
    )

    return jsonify(Note.getNotes());

@app.delete('/apps/notes/note/<int:idNote>/delete')
def deleteNote(idNote):
   
    return jsonify( Note.deleteNote(idNote));

@app.delete('/apps/notes/folder/<int:idFolder>/delete')
def deleteFolder(idFolder):
    
    return jsonify(Folder.deleteFolder(idFolder));

if __name__ == "__main__":
    app.run(debug=True,port=5001)
