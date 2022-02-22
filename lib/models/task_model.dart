class TaskModel{
  String? taskTitle;
  String? taskSubTitle;
  bool? status;

  TaskModel({
    required this.taskTitle,
    required this.taskSubTitle,
    required this.status
  });

  Map<String, dynamic> toJson() {
    return {
      'taskTitle': taskTitle,
      'taskSubtitle': taskSubTitle,
      'status': status,
    };
  }

  TaskModel.fromJson(Map<String, dynamic> json)
      : taskTitle = json['taskTitle'],
        taskSubTitle = json['taskSubtitle'],
        status = json['status'];
}