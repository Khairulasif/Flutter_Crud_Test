import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: 3, shrinkWrap: true,
              itemBuilder: (BuildContext context, i){
            return Padding(
                padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.white,
                title: const Text("Title"),
                subtitle: const Text("Subtitle"),
                trailing: PopupMenuButton(
                    child: const Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                        const PopupMenuItem(
                          value: "edid",
                            child: Text("Edit")),
                        const PopupMenuItem(
                            value: "delete",
                            child: Text("Delete")),
                      ],
                  onSelected: (String value) {
                      if(value == "edit") {}
                      if(value == "delete") {}
                  },
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
