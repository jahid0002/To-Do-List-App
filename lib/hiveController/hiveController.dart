

import 'package:hive_flutter/adapters.dart';
import 'package:practice_hive4/hiveController/hiveModel.dart';
import 'package:hive/hive.dart';

class HiveController {
  static Box<HiveNoteModel> getData() => Hive.box<HiveNoteModel>('note');
}
