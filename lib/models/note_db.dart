import 'package:flutter/foundation.dart';
import 'package:fp_tekber_kel4/models/note.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class NoteDB extends ChangeNotifier {
  static late Isar isar;

  //Initialize DB
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  //Notes List
  final List<Note> currentNotes = [];

  //Create
  Future<void> addNote(String textFromUser) async {
    //New Note Obj
    final newNote = Note()..text = textFromUser;

    //Save to DB
    await isar.writeTxn(() => isar.notes.put(newNote));

    //Re-read from DB
    fetchNotes();
  }

  //Read
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  //Update
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  //Delete
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
