import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:technical_test/Dataset/Attendance_Dataset.dart';
import 'package:technical_test/Getx%20controller/List_controller.dart';
import 'package:technical_test/main.dart';
import 'package:timeago/timeago.dart' as timeago;

class Add_Data extends StatefulWidget {
  const Add_Data({Key? key}) : super(key: key);

  @override
  State<Add_Data> createState() => _Add_DataState();
}

class _Add_DataState extends State<Add_Data> {
  void initState() {
    super.initState();
  }

  final nameTexteditor = TextEditingController();
  final phoneTexteditor = TextEditingController();
  var formatter = DateFormat.yMd().add_jm().format(DateTime.now());
  String names = '';
  String numbers = '';
  DATA _add = Get.put(DATA());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            TextFormField(
                controller: nameTexteditor,
                decoration: InputDecoration(
                    isDense: true, // important line
                    contentPadding: EdgeInsets.fromLTRB(0, 20, 10, 0),
                    prefixIcon: Icon(Icons.email),
                    hintText: "name",
                    fillColor: Colors.white70,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ))),
                validator: (val) => val!.isEmpty ? 'Enter a name' : null,
                onChanged: (val) {
                  setState(() => names = val);
                }),
            TextFormField(
                controller: phoneTexteditor,
                decoration: InputDecoration(
                    isDense: true, // important line
                    contentPadding: EdgeInsets.fromLTRB(0, 20, 10, 0),
                    prefixIcon: Icon(Icons.email),
                    hintText: "phone",
                    fillColor: Colors.white70,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ))),
                validator: (val) => val!.isEmpty ? 'Enter a phone' : null,
                onChanged: (val) {
                  setState(() => numbers = val);
                }),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('INFO RECORDED')));
                setState(() {
                  _add.datasets.add(
                      {'name': names, 'phone': numbers, 'Date': formatter});
                });
              },
              child: Text(
                "ADD",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
