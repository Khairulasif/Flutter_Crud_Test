import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_flutter_practice/helper/navigator.dart';
import 'package:for_flutter_practice/src/view/todo_create.dart';
import 'package:for_flutter_practice/src/view/todo_edit.dart';

class TodoViewModel extends ChangeNotifier {


  final NavigationService _navigationService;

  TodoViewModel(this._navigationService) {

  }

  navigateToCreate() {
    //Bad Practice
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => TodoCreate()));

    _navigationService.navigate(const TodoCreate());
  }

  navigateToEdit(){
    _navigationService.navigate(const TodoEdit());
  }
}