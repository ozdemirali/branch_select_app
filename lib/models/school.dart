class School{
  final String schoolName;
  final String branchTeacher;
  final String assistantDirector;
  final String firstBranch;
  final String secondBranch;
  final int minClassCount;

  School({
    required this.schoolName,
    required this.branchTeacher,
    required this.assistantDirector,
    required this.firstBranch,
    required this.secondBranch,
    required this.minClassCount,
});

  factory School.fromJson(Map<String,dynamic>json){
    return School(
        schoolName: json["SchoolName"],
        branchTeacher: json["BranchTeacher"],
        assistantDirector: json["AssistantDirector"],
        firstBranch: json["FirstBranch"],
        secondBranch: json["SecondBranch"],
        minClassCount: json["MinClassCount"]);
  }

  toJson(){
    return{
      "SchoolName":schoolName,
      "BranchTeacher":branchTeacher,
      "AssistantDirector":assistantDirector,
      "FirstBranch":firstBranch,
      "SecondBranch":secondBranch,
      "MinClassCount":minClassCount
    };
  }

}