import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/todo_viewmodel.dart';

class TodoCreate extends StatefulWidget {
  const TodoCreate({super.key});

  @override
  State<TodoCreate> createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreate> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final todocontroller = Provider.of<TodoViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Todo Create"),
      ),
      body: Form(
        key: formKey,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: 400,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: todocontroller.titleController,
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Required Field';
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.red),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Title",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: 400,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: todocontroller.descriptionController,
                    minLines: 3,
                    maxLines: 3,
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Required Field';
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.red),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Description",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    if(formKey.currentState!.validate()) {
                      todocontroller.createTodo();
                    }
                  },
                  child: Container(
                    width: 400,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

