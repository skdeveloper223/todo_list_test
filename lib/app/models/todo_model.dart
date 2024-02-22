class TodoModel {
  String name;
  String description;
  int timeTemp;
  int? id;
  bool status;

  TodoModel({this.id, required this.name, required this.description, required this.timeTemp, required this.status});
  Map<String, dynamic> toJson() => {'name': name, 'description': description, 'timeTemp': timeTemp, 'status': status};

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
      id: json['id'], name: json['name'].toString(), description: json['description'].toString(), timeTemp: json['timeTemp'], status: json['status']);
}
