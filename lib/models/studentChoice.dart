class StudentChoice{
  final String id;
  final String nameAndSurname;
  final String choice;
  final double score;
  final String result;

  StudentChoice({
    required this.id,
    required this.nameAndSurname,
    required this.choice,
    required this.score,
    required this.result,
});

  factory StudentChoice.fromJson(Map<String,dynamic>json){
    return StudentChoice(
        id: json["Id"],
        nameAndSurname: json["NameAndSurname"],
        choice: json["Choice"],
        score: json["Score"],
        result: json["Result"]);
  }
}