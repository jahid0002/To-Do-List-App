import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:practice_hive4/apiController/apiController.dart';
import 'package:practice_hive4/hiveController/hiveController.dart';
import 'package:practice_hive4/hiveController/hiveModel.dart';
import 'package:practice_hive4/widget/widget.dart';
import 'package:provider/provider.dart';

class HivePage extends StatelessWidget {
  final nameClt = TextEditingController();
  final numberClt = TextEditingController();
  Future<void> _showDialog(context) async {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: text('Add Note', 25, FontWeight.w600, Colors.pinkAccent),
            content: Container(
              height: 150, 
              width: 200,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: nameClt,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration( 
                        hintText: 'Enter Name',
                        prefixIcon: Icon(
                          Icons.edit,
                          color: Colors.pinkAccent,
                        ),
                        focusColor: Colors.pinkAccent,
                      ),
                    ), 
                    const SizedBox(height: 10,),
                    TextField(
                      controller: numberClt,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration( 
                        hintText: 'Enter Number',
                        prefixIcon: Icon(
                          Icons.edit,
                          color: Colors.pinkAccent,
                        ),
                        focusColor: Colors.pinkAccent,
                      ),
                    ), 
                    
                    Consumer<ApiController>(
                      builder: ((context, data, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                child: Text(
                              data.imageUrl,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                            IconButton(
                                onPressed: () {
                                  data.imagePicker();
                                },
                                icon: const Icon(
                                  Icons.image,
                                  color: Colors.pinkAccent,
                                  size: 22,
                                ))
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      text('Cancel', 18, FontWeight.w600, Colors.pinkAccent)),
              Consumer<ApiController>(
                builder: (context, data, child) {
                  return TextButton(
                      onPressed: () async {
                       // ignore: non_constant_identifier_names
                       HiveNoteModel Data = HiveNoteModel(
                            name: nameClt.text,
                            number: numberClt.text,
                            img: data.imgPath);
                        final box = HiveController.getData();
                        box.add(Data);
                        Data.save();
                        Navigator.pop(context);
                      },
                      child: text(
                          'Submit', 18, FontWeight.w600, Colors.pinkAccent));
                },
              ),
            ],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: text('Hive', 22, FontWeight.w600, Colors.white),
        leading: const Icon(Icons.home,color: Colors.white,),
      ),
      body: ValueListenableBuilder(
          valueListenable: HiveController.getData().listenable(),
          builder: ((context, box, child) {
            var list = box.values.toList().cast<HiveNoteModel>();
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    onLongPress: () {
                      list[index].delete();
                    },
                    leading: list[index].img != null ? Image.file(
                      list[index].img!,
                      height: 100,
                      width: 100,
                    ) : Image.asset('assets/one.jpg',  height: 100,
                      width: 100,),
                    title: text('${list[index].name}', 22, FontWeight.w600,
                        Colors.black),
                    subtitle: text('${list[index].number}', 16, FontWeight.w600,
                        Colors.black),
                  );
                }));
          })),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          _showDialog(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
