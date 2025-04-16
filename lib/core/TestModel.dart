
class TestModel{
  final String? title;
  const TestModel({this.title});

  TestModel.fromJson(Map<String, dynamic> json) : this(title: json['title']);

  Map<String, dynamic> toJson() => {'title': title};
}




