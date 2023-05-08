// ignore_for_file: public_member_api_docs, sort_constructors_first
class Student {

  int? id;
  String? name;
  double? gpa;
  late bool isMale;
  // getId() {}
  Student({
    this.id,
    this.name,
    this.gpa,
    this.isMale = true,
  });
  Student.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
    gpa = map['gpa'];
    isMale = map['isMale'] == 1 ? true : false;
  }
  toMap() {
    return {"name": name, "isMale": isMale ? 1 : 0, "gpa": gpa};
  }
}
