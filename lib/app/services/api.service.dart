import 'dart:developer';
import 'package:dio/dio.dart';

final ApiServices api = ApiServices();

class ApiServices {
  var baseurl = 'http://10.0.2.2:3000/api';

  Future getDio(String path, {Map<String, dynamic>? params}) async {
    String url = baseurl + path;
    log(url);
    var headers = {'accept': 'application/json'};
    var response = await Dio().get(
      url,
      queryParameters: params,
      options: Options(headers: headers),
    );
    return response;
    // } catch (e) {
    //   log('API Error: ${e.toString()}');
    // }
  }
}
