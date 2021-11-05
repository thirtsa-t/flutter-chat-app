class GroupModel {
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  String status;
  bool select = false;
  int id;
  GroupModel({
    required
    this.name,
    required
    this.icon,
    required
    this.isGroup,
    required
    this.time,
    required
    this.currentMessage,
    required
    this.status,
    this.select = false,
    required
    this.id,
  });
}
