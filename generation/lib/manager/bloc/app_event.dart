// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

part of 'app_bloc.dart';

abstract class AppBlocEvent extends Equatable {}

class AddModelEvent extends AppBlocEvent {
  final String model;
  AddModelEvent({
    required this.model,
  });

  @override
  List<Object?> get props => [model];
}

class AddPromptEvent extends AppBlocEvent {
  final String prompt;
  AddPromptEvent({
    required this.prompt,
  });
  @override
  List<Object?> get props => [prompt];
}

class DeleteModelEvent extends AppBlocEvent {
  int index;
  DeleteModelEvent({
    required this.index,
  });

  @override
  List<Object?> get props => [index];
}

class DeletePromptEvent extends AppBlocEvent {
  int index;
  DeletePromptEvent({
    required this.index,
  });

  @override
  List<Object?> get props => [index];
}

class GetPromptEvent extends AppBlocEvent {
  @override
  List<Object?> get props => [];
}

class GetModelEvent extends AppBlocEvent {
  @override
  List<Object?> get props => [];
}
