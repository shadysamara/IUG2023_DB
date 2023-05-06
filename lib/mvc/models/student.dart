// ignore_for_file: public_member_api_docs, sort_constructors_first
class Student {
  int? id;
  String? name;
  bool? isMale;
  double? gpa;
  Student({
    this.id,
    required this.name,
    required this.isMale,
    required this.gpa,
  });
  factory Student.adam(bool x) {
    if (x) {
      return Student(gpa: 99.4, isMale: true, name: "adam", id: 1);
    } else {
      return Student.fromMap({});
    }
  }
  Student.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
    isMale = map['isMale'] == 1 ? true : false;
    gpa = map['gpa'];
  }
  toMap() {
    return {"name": name, "isMale": isMale ?? true ? 1 : 0, "gpa": gpa};
  }
}
