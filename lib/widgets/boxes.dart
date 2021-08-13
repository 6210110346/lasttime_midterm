import 'package:hive/hive.dart';
import 'package:midterm/objects/work.dart';

class Boxes {
  static Box<Work> getWorks() => Hive.box<Work>('works');
}
