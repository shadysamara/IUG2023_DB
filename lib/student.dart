class Student {
  int? id;
  String? name;
  String? gender;
  int? gpa;
  Student({this.id, this.name, this.gender, this.gpa});
  toMap() {
    return {"name": name,
    "Gender":gender,
    "Gpa":gpa
    };
  }
}
