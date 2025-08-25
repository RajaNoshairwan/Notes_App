import 'package:hive/hive.dart';

part 'note.g.dart'; // Hive will generate this

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  Note({
    required this.title,
    required this.content,
  });
}
