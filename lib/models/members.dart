class Members {
  String member_name;

  Members.fromJson(Map<String, dynamic> map)
      : member_name = map['member_fname'] + " " + map['member_lname'] ?? "";
}
