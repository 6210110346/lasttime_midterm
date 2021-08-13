import 'package:hive/hive.dart';

part 'work.g.dart';

@HiveType(typeId: 0)
class Work extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String type;

  @HiveField(2)
  late List<DateTime> timeList = [];

  Work({required this.type, required this.title, required this.timeList});

  String toString() {
    return 'title: $title type: $type time: ${timeList.toString()}';
  }
}

// var workList = [
//   Work(type: 'homework', title: 'กวาดบ้าน', time: DateTime.now())
// ];
