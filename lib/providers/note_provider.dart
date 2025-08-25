import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/note.dart';

class NoteProvider with ChangeNotifier {
  final Box<Note> noteBox = Hive.box<Note>('notes');

  List<Note> get notes => noteBox.values.toList();

  void addNote(Note note) {
    noteBox.add(note);
    notifyListeners();
  }

  void updateNote(Note note, String newTitle, String newContent) {
    note.title = newTitle;
    note.content = newContent;
    note.save();
    notifyListeners();
  }

  void deleteNote(Note note) {
    note.delete();
    notifyListeners();
  }
}
