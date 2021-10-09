class NotesModel {
  String? title;
  String? content;
  String? time;
  String? date;

  NotesModel({
    required this.title,
    required this.content,
    required this.time,
    required this.date,
  });

  NotesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    time = json['time'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['content'] = content;
    data['time'] = time;
    data['date'] = date;
    return data;
  }
}
