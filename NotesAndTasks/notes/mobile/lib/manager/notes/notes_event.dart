// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

part of 'notes_bloc.dart';

abstract class NotesEvent extends Equatable {}

class GetFoldersEvent extends NotesEvent {
  @override
  List<Object?> get props => [];
}

class GetNotesEvent extends NotesEvent {
  @override
  List<Object?> get props => [];
}

class DeleteFolderEvent extends NotesEvent {
  int id;
  DeleteFolderEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class DeleteNoteEvent extends NotesEvent {
  int id;
  DeleteNoteEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class CreateNoteEvent extends NotesEvent {
  String title;
  CreateNoteEvent({required this.title});
  @override
  List<Object?> get props => [title];
}

class CreateFolderEvent extends NotesEvent {
  String title;
  CreateFolderEvent({required this.title});
  @override
  List<Object?> get props => [title];
}
