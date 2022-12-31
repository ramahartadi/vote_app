import 'package:vote_application/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vote_application/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 160, 0, 0),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: const Color.fromARGB(255, 192, 0, 0)),
          textTheme:
              Theme.of(context).textTheme.apply(fontFamily: 'Metropolis')),
      home: const WidgetTree(),
    );
  }
}
