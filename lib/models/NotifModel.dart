class NotifModel {
  final int idNotif;
  final String iconStatus;
  final String titleStatus;
  final String title;
  final String desc;
  final int hour;
  final bool isRead;

  NotifModel(
      {required this.idNotif,
      required this.iconStatus,
      required this.titleStatus,
      required this.title,
      required this.desc,
      required this.hour,
      required this.isRead});
}
