class Student {
  int? id;
  String? name;
  bool? gender;
  int? age;
  Student({this.id, this.name, this.gender, this.age});
  toMap() {
    return {
      "name":name,
      "age":age,
      "gender":gender
    };
  }
}
