import 'dart:developer';
import 'package:get/get.dart';
import 'package:myflutter_nov2025/app/services/api.service.dart';
import 'package:myflutter_nov2025/app/services/sharedprefs.dart';
import 'package:myflutter_nov2025/app/views/add_report.screen.dart';
import 'package:myflutter_nov2025/app/views/login.screen.dart';
import '../models/report.model.dart';

class ReportController extends GetxController {
  var reportList = <Report>[
    //Report(id: 1, title: 'Fire Inspection', date: '10-11-2025', category: 'safety', imagePath: ''),
    //Report(id: 2, title: 'Broken Window', date: '08-11-2025', category: 'property', imagePath: ''),
    //Report(id: 3, title: 'Unauthorized Access Server Room', date: '05-11-2025', category: 'security', imagePath: ''),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getReports();
  }

  Future<void> navigateToAddReport() async{
    await Get.to(() => AddReportScreen());
    getReports();
  }

  Future<void> onLogout() async{
    await SharedPrefs.removeLocalStorage('token');
    await SharedPrefs.removeLocalStorage('user');
    await Get.to(() => LoginScreen());
  }

  Future<void> getReports() async {
    log('Starting getReports()');
    try {
      var result = await api.getDio('/reports');
      log('API call successful, result: $result');
      if (result != null && result.statusCode == 200) {
        log('Status code is 200, processing data...');
        reportList.assignAll(
          (result.data['data'] as List).map((report) {
            return Report(
              id: report['id'],
              title: report['title'],
              date: report['date'],
              category: report['category'],
              imagePath: report['image_path'] != null
                  ? '${api.baseurl}/${report['image_path']}'
                  : '',
            );
          }).toList(),
        );
      } else {
        log('Unexpected status code: ${result?.statusCode}');
      }
    } catch (e) {
      log('Error in getReports: ${e.toString()}');
    }
  }
}
