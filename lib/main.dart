import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/note.dart';
import 'providers/note_provider.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('notes');

  // ✅ Prevent red error screen from showing
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Center(
      child: Text(
        "Something went wrong!",
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  };

  runApp(
    ChangeNotifierProvider(
      create: (_) => NoteProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      home: SplashScreen(),
    );
  }
}
