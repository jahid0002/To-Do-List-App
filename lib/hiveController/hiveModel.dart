import 'dart:io'; 
import 'package:hive/hive.dart'; 
part 'hiveModel.g.dart';

@HiveType(typeId: 0)
class HiveNoteModel extends HiveObject{
  @HiveField(0) 
  String name; 
  @HiveField(1)
  String number; 
  @HiveField(2)
  File? img;

  HiveNoteModel({
    required this.name, 
    required this.number, 
    this.img
  });
}
