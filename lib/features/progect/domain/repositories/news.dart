class News {
   String? title;
   String? description;
  News(this.title, this.description);
  News.fromjson(Map<String, dynamic> json) {
    title=
    json['title'];
    description=
    json['description'];
  }
}
