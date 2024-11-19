import 'package:flutter/material.dart';
import 'package:fp_tekber_kel4/models/note_db.dart';
import 'package:provider/provider.dart';
import 'pages/notes_page.dart';

void main() async {
  //Initialize Note Isar DB
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDB.initialize();

  runApp(
    ChangeNotifierProvider(
      create: (context) => NoteDB(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
    );
  }
}
