// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

abstract class AppBlocState extends Equatable {}

class NotesInitial extends AppBlocState {
  @override
  List<Object?> get props => [];
}

class GetPromptsState extends AppBlocState {
  final List<String> prompts;

  GetPromptsState(this.prompts);

  @override
  List<Object?> get props => [prompts];
}

class GetModelsState extends AppBlocState {
  final List<String> models;

  GetModelsState(this.models);

  @override
  List<Object?> get props => [models];
}
