// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:equatable/equatable.dart';
// import 'package:flutter_spotify_ui/data/hive/service_hive.dart';
import 'package:bloc/bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppBlocEvent, AppBlocState> {
  AppBloc() : super(NotesInitial()) {
    on<GetPromptEvent>(_getPrompts);
    on<GetModelEvent>(_getModels);

    on<AddPromptEvent>(_addPrompt);
    on<DeletePromptEvent>(_deletePrompt);
    on<AddModelEvent>(_addModel);
    on<DeleteModelEvent>(_deleteModel);
  }

  Future<void> _getPrompts(
    GetPromptEvent event,
    Emitter<AppBlocState> state,
  ) async {
    final List<String> result = [];
    emit(GetPromptsState(result));
  }

  Future<void> _addPrompt(
    AddPromptEvent event,
    Emitter<AppBlocState> state,
  ) async {}

  Future<void> _deletePrompt(
    DeletePromptEvent event,
    Emitter<AppBlocState> state,
  ) async {}

  Future<void> _getModels(
    GetModelEvent event,
    Emitter<AppBlocState> state,
  ) async {
    final List<String> result = [];
    emit(GetModelsState(result));
  }

  Future<void> _addModel(
    AddModelEvent event,
    Emitter<AppBlocState> state,
  ) async {}

  Future<void> _deleteModel(
    DeleteModelEvent event,
    Emitter<AppBlocState> state,
  ) async {}
}
