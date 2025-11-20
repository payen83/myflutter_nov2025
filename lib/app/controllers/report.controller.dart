import 'dart:developer';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:myflutter_nov2025/app/services/api.service.dart';
import '../models/report.model.dart';

class ReportController extends GetxController {
  var reportList = <Report>[
    // Report(id: 1, title: 'Fire Inspection', date: '10-11-2025', category: 'safety', imagePath: ''),
    // Report(id: 2, title: 'Broken Window', date: '08-11-2025', category: 'property', imagePath: ''),
    // Report(id: 3, title: 'Unauthorized Access Server Room', date: '05-11-2025', category: 'security', imagePath: ''),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getReports();
  }

  getReports() async {
    log('Starting getReports()');
    try {
      var result = await api.getDio('/products');
      log('API call successful, result: $result');
      if (result != null && result.statusCode == 200) {
        log('Status code is 200, processing data...');
        reportList.assignAll(
          (result.data['products'] as List).map((report) {
            return Report(
              id: report['id'],
              title: report['title'],
              date: report['price'].toString(),
              category: report['category'],
              imagePath: report['thumbnail'] != null
                  ? report['thumbnail'].toString()
                  : '',
            );
          }).toList(),
        );
        log('Report list updated with ${reportList.length} items');
      } else {
        log('Unexpected status code: ${result?.statusCode}');
      }
    } catch (e) {
      log('Error in getReports: ${e.toString()}');
      if (e is DioException) {
        log('Dio Error: ${e.type} - ${e.message}');
      }
    }
  }
}
