import 'package:dio/dio.dart';
import '../repository/shared_repo.dart';

class URLConstants {
  static const String baseURL = 'https://greatgreysled16.conveyor.cloud/';
  static const String signalrConnectionID = '';
  static const String signalRBaseURL =
      'https://aicallsevents-demo.hostedapp.in/eventinghub';
  static String authToken = 'auth_token';

  static BaseOptions baseOptions() {
    BaseOptions options = BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
        connectTimeout: 30000,
        // 60 seconds
        receiveTimeout: 30000,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${SharedRepo().getUserToken()}',
          //'x-origin-connection-id': signalrConnectionID,
        });
    return options;
  }

  static String login() => 'api/Login/Login';

  static String saveProductionURI() => 'api/Production/SaveProd';

  static String saveQualityURI() => 'api/Quality/SaveQty';

  static String saveBreakDownURI() => 'api/BreakDown/SaveBreak';

}
