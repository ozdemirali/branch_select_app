class BranchStatus{
  final String firstBranch;
  final int firstBranchNumber;
  final String secondBranch;
  final int secondBranchNumber;
  final int total;

  BranchStatus({
    required this.firstBranch,
    required this.firstBranchNumber,
    required this.secondBranch,
    required this.secondBranchNumber,
    required this.total,
});

  factory BranchStatus.fromJson(Map<String,dynamic>json){
    return BranchStatus(
        firstBranch: json["FirstBranch"],
        firstBranchNumber: json["FirstBranchNumber"],
        secondBranch: json["SecondBranch"],
        secondBranchNumber: json["SecondBranchNumber"],
        total: json["Total"]);
  }

}