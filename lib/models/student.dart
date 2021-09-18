class Student{
  final String id;
  final String nameAndSurname;
  final int firstSelect;
  final int secondSelect;
  final String choice;
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
    required this.firstSelect,
    required this.secondSelect,
    required this.choice,
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
        firstSelect: json["FirstSelect"],
        secondSelect: json["SecondSelect"],
        choice: json["Choice"],
        nameAndSurname: json["NameAndSurname"],
        parentNameAndSurname: json["ParentNameAndSurname"],
        className: json["Class"],
        address: json["Address"],
        phone: json["Phone"],
        email: json["Email"],
        score: json["Score"],
        isDeleted: json["IsDeleted"]);
  }


  //We have not all parameters so that same parameter is removed by this method
  toJson(){
    return{
      "Id":id,
      "FirstSelect":firstSelect,
      "SecondSelect":secondSelect,
      "NameAndSurname":nameAndSurname,
      "Class":className,
      "ParentNameAndSurname":parentNameAndSurname,
      "Address":address,
      "Phone":phone,
      "Email":email,
    };
  }
}