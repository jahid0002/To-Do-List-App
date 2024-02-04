import 'package:flutter/material.dart';
import 'package:practice_hive4/apiController/apiController.dart';
import 'package:practice_hive4/widget/widget.dart';
import 'package:provider/provider.dart';

class ApiPage extends StatelessWidget {
  const ApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: text('Api List', 22, FontWeight.w600, Colors.white),
        leading: const Icon(Icons.home, color: Colors.white,),
      ),
      body: Consumer<ApiController>(
        builder: (context, data, child) {
          return FutureBuilder(
              future: data.getData(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: data.apiList.length,
                    itemBuilder: (context, index) {
                    return ListTile(
                     
                      leading: text('${data.apiList[index].id}', 20, FontWeight.w500, Colors.black),
                      title: text('${data.apiList[index].title}', 22, FontWeight.w600, Colors.black),
                      subtitle: text('${data.apiList[index].body}', 15, FontWeight.w500, Colors.pinkAccent)
                    );
                  });
                } else {
                  return const Center(child: Text('Loading...'));
                }
              }));
        },
      ),
    );
  }
}
