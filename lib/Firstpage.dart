import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:technical_test/Dataset/ADD_data.dart';
import 'package:technical_test/Dataset/Attendance_Dataset.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:technical_test/Getx%20controller/List_controller.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    void initState() {
      super.initState();
    }

    ScrollController _controller;

    final DATA fetchData = Get.find();
    DateTime now = new DateTime.now();

    fetchData.datasets.sort((a, b) => b['Date'].compareTo(a['Date']));
    final f = new DateFormat('dd-MM-yyyy hh:mm a');
    bool isChanged = false;
    return Scaffold(
      body: ListView(children: [
        const SizedBox(
          height: 20,
        ),
        Switch(
          value: isChanged,
          onChanged: (value) {
            setState(() {
              isChanged = value;
              print(isChanged);
            });
          },
          activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.green,
        ),
        TextField(
          onChanged: (value) => fetchData.filter(value),
          decoration: const InputDecoration(
            labelText: 'Search',
            suffixIcon: Icon(Icons.search),
          ),
        ),
        Obx(() => Flexible(
            child: ListView.builder(
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: fetchData.SearchInfo.value.length,
                itemBuilder: ((context, index) {
                  final user = fetchData.SearchInfo.value;
                  return Card(
                      child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                        title: Text(fetchData.SearchInfo.value[index]['name']),
                        subtitle: isChanged == true
                            ? //check if loading is true or false
                            Text(timeago.format(
                                fetchData.SearchInfo.value[index]['Date']))
                            : //show progress on loading = true
                            Text(
                                "${fetchData.SearchInfo.value[index]['Date']}"),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => Scaffold(
                                    appBar: AppBar(
                                      title: Text(fetchData
                                          .SearchInfo.value[index]['name']),
                                    ),
                                    body: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          fetchData.SearchInfo.value[index]
                                              ['phone'],
                                          style: const TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Check in : ${fetchData.SearchInfo.value[index]['Date']}',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              Share.share(
                                                  '${fetchData.SearchInfo.value[index]['phone']}',
                                                  subject:
                                                      '${fetchData.SearchInfo.value[index]['name']}');
                                            },
                                            child: Text('Share')),
                                      ],
                                    ),
                                  ))));
                        }),
                  ));
                })))),
        Container(
          height: 40,
          color: Colors.deepOrange,
          child: Center(
            child: Text(
              'End of list',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Add_Data()));
          },
          child: const Text("Add attendance")),
    );
  }
}
