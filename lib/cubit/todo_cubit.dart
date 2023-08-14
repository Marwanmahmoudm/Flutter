import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled3/Model/TodoModel.dart';
import 'package:untitled3/Service/TodosService.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial()){
    getMyTodos();
  }

  List<Todos>todos=[];

  getMyTodos() async{
    try{
      emit(TodosLoading());
      todos=await TodosService().gettodo();
      emit(TodosSuccess());
    }
    catch(e){
      emit(TodosError());
    }

  }
}
