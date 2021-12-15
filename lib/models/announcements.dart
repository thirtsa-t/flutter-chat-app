class Announcements {
  String content;
  String member_name;
  String time;

  Announcements.fromJson(Map<String, dynamic> map)
      : content = map['announcement_content'] ?? "",
        member_name = map['member_fname'] +" "+ map['member_lname']?? "",
        time = map['announcement_time']?? "";
}