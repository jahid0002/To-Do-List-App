import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practice_hive4/apiController/apiController.dart';

import 'package:practice_hive4/hiveController/hiveModel.dart';
import 'package:practice_hive4/pages/homePage.dart';
import 'package:practice_hive4/widget/allProvider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(HiveNoteModelAdapter());
  await Hive.openBox<HiveNoteModel>('note');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ApiController()),
       ChangeNotifierProvider(create: (_) => AllProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
