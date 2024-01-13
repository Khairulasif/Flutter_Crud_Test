import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_flutter_practice/helper/navigator.dart';
import 'package:for_flutter_practice/helper/network.dart';
import 'package:for_flutter_practice/src/view/todo_create.dart';
import 'package:for_flutter_practice/src/view/todo_edit.dart';
import 'package:for_flutter_practice/src/view/todo_list.dart';

import '../model/todo_model.dart';

class TodoViewModel extends ChangeNotifier {


  final NavigationService _navigationService;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<TodoModel> allTodos =[];

  TodoViewModel(this._navigationService) {
    getAllTodos();
  }

  navigateToCreate() {
    //Bad Practice
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => TodoCreate()));

    _navigationService.navigate(const TodoCreate());
  }

  navigateToEdit(TodoModel data){
    titleController.text = data.todoTitle.toString();
    descriptionController.text = data.todoDescription.toString();
    _navigationService.navigate(TodoEdit(tododata: data));
  }


  getAllTodos() async{

  _navigationService.showLoader();
  var resData = await ApiProvider().get("/yt-todo-app");
  allTodos = resData.map<TodoModel>((item) => TodoModel.fromJson(item)).toList();
  print(allTodos);
  _navigationService.goBack();
  notifyListeners();
  }

  createTodo() async {

    print(titleController.text);
    print(descriptionController.text);
    _navigationService.showLoader();

    var resData = await ApiProvider().post("/yt-todo-app", {
      'todo_title': titleController.text,
      'todo_description': descriptionController.text,
    });

    if (resData != null && resData) {
      getAllTodos();
      _navigationService.goBack();
      _navigationService.navigate(const TodoList());
      titleController.clear();
      descriptionController.clear();
    } else {
      // Handle the case where resData is null or not a boolean
      print("Failed to create todo");
    }
  }

  editTodo(id) async {
    _navigationService.showLoader();

    var resData = await ApiProvider().put("/yt-todo-app/$id", {
      'todo_title': titleController.text,
      'todo_description': descriptionController.text,
    });

    if (resData != null && resData) {
      getAllTodos();
      _navigationService.goBack();
      _navigationService.navigate(const TodoList());
      titleController.clear();
      descriptionController.clear();
    } else {
      // Handle the case where resData is null or not a boolean
      print("Failed to edit todo");
    }
  }


  deleteTodo(id, index) async {

    _navigationService.showLoader();
    var resData = await ApiProvider().delete("/yt-todo-app/$id");
    _navigationService.goBack();
    if(resData) {
      allTodos.removeAt(index);
      notifyListeners();
    } else {
      print("Not Deleted");
    }
  }
}