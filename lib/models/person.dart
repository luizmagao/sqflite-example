class Person {
  int? id;
  String? name;
  int? age;

  Person({this.id, required this.name, this.age});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    return data;
  }

  @override
  String toString() {
    return 'Person {id: $id, name: $name, age: $age}';
  }
}
