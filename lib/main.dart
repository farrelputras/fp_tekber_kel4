import 'package:flutter/material.dart';
import 'pages/notes_page.dart'; // Pastikan path benar sesuai struktur folder Anda

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, // Material 3 mendukung UI yang lebih modern
      ),
      home: const NotesPage(),
    );
  }
}
