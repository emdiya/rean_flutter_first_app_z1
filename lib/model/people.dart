class Person {
  int? userID;
  int? id;
  String? title;
  String? body;
  Person({this.userID, this.id, this.title, this.body});
  Person.formJson(Map<dynamic, dynamic> json) {
    userID = json['userID'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}
