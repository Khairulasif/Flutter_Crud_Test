import 'package:flutter/material.dart';

class TodoCreate extends StatefulWidget {
  const TodoCreate({super.key});

  @override
  State<TodoCreate> createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreate> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Todo Create"),
      ),
      body: Form(
        key: formKey,
          child: Column(
            children: [
              SizedBox(
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
              Container(
                width: 400,
                height: 55,
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),

              )
            ],
          )),
    );
  }
}

