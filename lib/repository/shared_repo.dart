import 'package:get_storage/get_storage.dart';
import '../constant/extensions.dart';
import '../constant/shared_preference_constants.dart';

class SharedRepo {
  final localStorage = GetStorage();

  void saveUser(Map<String, dynamic> loginModelMap) {
    saveUserNameAndPassword(
      loginModelMap['userName'],
      loginModelMap['password'],
      loginModelMap['rememberMe'],
    );
  }

  Future<void> saveUserNameAndPassword(
      String userName, String password, bool rememberMe) async {
    await localStorage.write(SharedPreferenceConstant.userName, userName);
    await localStorage.write(SharedPreferenceConstant.password, password);
    await localStorage.write(SharedPreferenceConstant.rememberMe, rememberMe);
  }

  Future<void> saveUserToken(String authToken) async {
    await localStorage.write(SharedPreferenceConstant.authToken, authToken);
    //AppConstants.AUTH_TOKEN = authToken;
  }

  Future<void> saveUserID(int userID) async {
    await localStorage.write(SharedPreferenceConstant.userID, userID);
  }

  Future<void> saveUserDetails(Map<String, dynamic> responseModelMap) async {
    await saveUserToken(toNullableString(responseModelMap['token']));
    await saveUserID(responseModelMap['userId']);
  }

  String getUserName() {
    return localStorage.read(SharedPreferenceConstant.userName) ?? "";
  }

  String getUserPassword() {
    return localStorage.read(SharedPreferenceConstant.password) ?? "";
  }

  bool getRememberCheck() {
    return localStorage.read(SharedPreferenceConstant.rememberMe) ?? false;
  }

  String getUserToken() {
    return localStorage.read(SharedPreferenceConstant.authToken) ?? "";
  }

  int getUserID() {
    return localStorage.read(SharedPreferenceConstant.userID) ?? 0;
  }

  Future<void> clearUserNameAndPassword() async {
    await localStorage.remove(SharedPreferenceConstant.userName);
    await localStorage.remove(SharedPreferenceConstant.password);
    await localStorage.remove(SharedPreferenceConstant.rememberMe);
  }

  Future<void> clearUserDetails() async {
    await localStorage.read(SharedPreferenceConstant.userID);
  }
}
