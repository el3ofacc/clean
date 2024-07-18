// class News {
//    String? title;
//    String? description;
//   News(this.title, this.description);
//   News.fromjson(Map<String, dynamic> json) {
//     title=
//     json['title'];
//     description=
//     json['description'];
//   }
// }

class Data {
   String? title;
  String? description;
  Data(this.title, this.description);
  Data.fromjson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }
}
