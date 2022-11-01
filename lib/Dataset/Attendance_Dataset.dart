import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class Dataset {
  String name;
  String phone;
  var Date;

  Dataset({required this.name, required this.phone, required this.Date});

  contains(String lowerCase) {}
}

class DATA extends GetxController {
  final List<Map<String, dynamic>> datasets = [
    {
      'name': 'Chan Saw Lin',
      'phone': "0152131113",
      'Date': DateTime.parse("2020-06-30 16:10:05")
    },
    {
      'name': 'Lee Saw Loy',
      'phone': "0161231346",
      'Date': DateTime.parse("2020-07-11 15:39:59")
    },
    {
      'name': 'Khaw Tong Lin',
      'phone': "0158398109",
      'Date': DateTime.parse("2020-08-19 11:10:18")
    },
    {
      'name': 'Lim Kok Lin',
      'phone': "0168279101",
      'Date': DateTime.parse("2020-08-19 11:11:35")
    },
    {
      'name': 'Low Jun Wei',
      'phone': "0112731912",
      'Date': DateTime.parse("2020-08-15 13:00:05")
    },
    {
      'name': 'Yong Weng Kai',
      'phone': "0172332743",
      'Date': DateTime.parse("2020-07-31 18:10:11")
    },
    {
      'name': 'Jayden Lee',
      'phone': "0191236439",
      'Date': DateTime.parse("2020-08-22 08:10:38")
    },
    {
      'name': 'Kong Kah Yan',
      'phone': "0111931233",
      'Date': DateTime.parse("2020-07-11 12:00:00")
    },
    {
      'name': 'Jasmine Lau',
      'phone': "0162879190",
      'Date': DateTime.parse("2020-08-01 12:10:05")
    },
    {
      'name': 'Chan Saw Lin',
      'phone': "016783239",
      'Date': DateTime.parse("2020-08-23 11:59:05")
    }
  ];

  Rx<List<Map<String, dynamic>>> SearchInfo =
      Rx<List<Map<String, dynamic>>>([]);

  @override
  void onInit() {
    super.onInit();
    SearchInfo.value = datasets;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void filter(String Name) {
    List<Map<String, dynamic>> results = [];
    if (Name.isEmpty) {
      results = datasets;
    } else {
      results = datasets
          .where((element) => element["name"]
              .toString()
              .toLowerCase()
              .contains(Name.toLowerCase()))
          .toList();
    }
    SearchInfo.value = results;
  }
}
