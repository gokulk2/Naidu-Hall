import '../../constant/variable_constant.dart';

class StreamControllerListener {
  homePageGridRefresher() {
    if (homeWidgetsStreamController.hasListener) {
      homeWidgetsStreamController.add(true);
    }
  }
}