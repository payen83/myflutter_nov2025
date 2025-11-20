import 'package:get/get.dart';
import '../models/report.model.dart';

class ReportController extends GetxController {
  var reportList = <Report> [
    Report(id: 1, title: 'Fire Inspection', date: '10-11-2025', category: 'safety', imagePath: ''),
    Report(id: 2, title: 'Broken Window', date: '08-11-2025', category: 'property', imagePath: ''),
    Report(id: 3, title: 'Unauthorized Access Server Room', date: '05-11-2025', category: 'security', imagePath: ''),
  ].obs;
}