import 'package:flutter/material.dart';
import 'package:practice_hive4/widget/allProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AllProvider>(
        builder: (context, data, child) {
          return data.list[data.currIndex];
        },
      ),
      bottomNavigationBar: Consumer<AllProvider>(
        builder: (context, data, child) {
          return BottomNavigationBar(
              selectedFontSize: 20,
              unselectedFontSize: 16,
              selectedItemColor: Colors.pinkAccent,
              unselectedItemColor: Colors.blueGrey,
              currentIndex: data.currIndex,
              onTap: (value) {
                data.changeIndex(value);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.hive), label: 'Hive'),
                BottomNavigationBarItem(icon: Icon(Icons.api), label: 'Api'),
              ]);
        },
      ),
    );
  }
}
