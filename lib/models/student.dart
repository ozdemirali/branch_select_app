class Student{
  final String id;
  final String nameAndSurname;
  final String parentNameAndSurname;
  final String className;
  final String address;
  final String phone;
  final String email;
  final double score;
  final bool isDeleted;

  Student({
    required this.id,
    required this.nameAndSurname,
    required this.parentNameAndSurname,
    required this.className,
    required this.address,
    required this.phone,
    required this.email,
    required this.score,
    required this.isDeleted,
});

  factory Student.fromJson(Map<String,dynamic>json){
    return Student(
        id: json["Id"],
        nameAndSurname: json["NameAndSurname"],
        parentNameAndSurname: json["ParentNameAndSurname"],
        className: json["ClassName"],
        address: json["Address"],
        phone: json["Phone"],
        email: json["Email"],
        score: json["Score"],
        isDeleted: json["IsDeleted"]);
  }
}