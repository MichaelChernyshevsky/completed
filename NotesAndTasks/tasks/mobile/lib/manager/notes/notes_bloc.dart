// // ignore_for_file: invalid_use_of_visible_for_testing_member
// import 'package:app_with_apps/api/notes/service/api_service.dart';
// import 'package:app_with_apps/constants/models/notes/folder_class.dart';
// import 'package:app_with_apps/constants/models/notes/note_class.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'notes_event.dart';
// part 'notes_state.dart';

// class NotesBloc extends Bloc<NotesEvent, NotesState> {
//   NotesBloc() : super(NotesInitial()) {
//     on<GetFoldersEvent>(_getFolders);
//     on<GetNotesEvent>(_getNotes);
//     on<DeleteFolderEvent>(_deleteFolder);
//     on<DeleteNoteEvent>(_deleteNote);
//     on<CreateNoteEvent>(_createNote);
//     on<CreateFolderEvent>(_createFolder);
//   }

//   ServiceApiNotes service = ServiceApiNotes();

//   Future<void> _getFolders(
//       GetFoldersEvent event, Emitter<NotesState> state) async {
//     try {
//       final data = await service.getFolders();
//       emit(FoldersData(folders: data));
//     } catch (error) {
//       emit(NotesError());
//     }
//   }

//   Future<void> _getNotes(GetNotesEvent event, Emitter<NotesState> state) async {
//     try {
//       final data = await service.getNotes();
//       emit(NotesData(notes: data));
//     } catch (error) {
//       emit(NotesError());
//     }
//   }

//   Future<void> _deleteFolder(
//       DeleteFolderEvent event, Emitter<NotesState> state) async {
//     try {
//       await service.deleteFolder(event.id);
//       emit(DeleteSucess());
//     } catch (error) {
//       emit(NotesError());
//     }
//   }

//   Future<void> _deleteNote(
//       DeleteNoteEvent event, Emitter<NotesState> state) async {
//     try {
//       await service.deleteNote(event.id);
//       emit(DeleteSucess());
//     } catch (error) {
//       emit(NotesError());
//     }
//   }

//   Future<void> _createNote(
//       CreateNoteEvent event, Emitter<NotesState> state) async {
//     try {
//       await service.createNote(event.title);
//       // emit(CreateSucess(id: 1));
//     } catch (error) {
//       emit(NotesError());
//     }
//   }

//   Future<void> _createFolder(
//       CreateFolderEvent event, Emitter<NotesState> state) async {
//     try {
//       await service.createFolder(event.title);
//       // emit(CreateSucess(id: 1));
//     } catch (error) {
//       emit(NotesError());
//     }
//   }
// }
