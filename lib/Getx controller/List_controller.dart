import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:technical_test/Dataset/Attendance_Dataset.dart';
import 'package:technical_test/Dataset/ADD_data.dart';

class NewList extends GetxController {
  Rx<List<Dataset>> datasets = Rx<List<Dataset>>([]);
  TextEditingController nameTexteditor = TextEditingController();
  TextEditingController phoneTexteditor = TextEditingController();
  late Dataset dataset;
  var formatter = DateFormat.yMd().add_jm().format(DateTime.now());
  @override
  void onclose() {
    nameTexteditor.dispose();
    phoneTexteditor.dispose();
  }

  addinfo(String name, String phone, var Date) {
    dataset = Dataset(name: name, phone: phone, Date: formatter);
    datasets.value.add(dataset);
  }
}
