class TodoModel {
  String? todoTitle;
  String? todoDescription;
  String? sId;

  TodoModel({this.todoTitle, this.todoDescription, this.sId});

  TodoModel.fromJson(Map<String, dynamic> json) {
    todoTitle = json['todo_title'];
    todoDescription = json['todo_description'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['todo_title'] = this.todoTitle;
    data['todo_description'] = this.todoDescription;
    data['_id'] = this.sId;
    return data;
  }
}
