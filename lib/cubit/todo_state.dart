part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}
class TodosLoading extends TodoState {}
class TodosError extends TodoState{}
class TodosSuccess extends TodoState{}
