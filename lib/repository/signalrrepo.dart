import 'dart:async';

import 'package:get/get.dart';
import 'package:mobileapp/repository/shared_repo.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

import '../constant/app_constants.dart';
import '../constant/page_enum.dart';

import '../constant/url_constants.dart';
import '../constant/variable_constant.dart';
import '../controller/common/stream_controller_listener.dart';
import '../controller/master_controller.dart';

typedef HubConnectionProvider = Future<HubConnection> Function();

class SignalRRepo {
  static late HubConnection _hubConnection;
  static bool _hubConnectionInitialized = false;
  static bool connectionIsOpen = false;
  static String messageSequence = "";

  static Future<void> initializeConnection() async {
    try {
      await _openConnection();
    } catch (e) {
      rapidSoftPrint(e);
      Future.delayed(const Duration(seconds: 5), () async {
        await _openConnection();
      });
    }
  }

  static Future<void> terminateConnection() async {
    _hubConnection.stop();
    _hubConnectionInitialized = false;
    connectionIsOpen = false;
  }

  static Future<void> _openConnection() async {
    if (_hubConnectionInitialized == false) {
      _hubConnection = HubConnectionBuilder()
          .withUrl(URLConstants.signalRBaseURL,
          options: HttpConnectionOptions(
              accessTokenFactory: () =>
                  Future.value(SharedRepo().getUserToken()),
              skipNegotiation: false) //,
        //transportType: HttpTransportType.WebSockets
      )
          .withAutomaticReconnect(retryDelays: [
        2000,
        5000,
        10000,
        20000,
        30000,
        40000,
        60000,
        90000
      ]).build();
      _hubConnectionInitialized = true;
      _hubConnection.serverTimeoutInMilliseconds = 90000;
      _hubConnection.keepAliveIntervalInMilliseconds = 5000;
      _hubConnection.onclose(({error}) {
        connectionIsOpen = false;
        rapidSoftPrint(error);
      });
      _hubConnection.onreconnecting(({error}) {
        rapidSoftPrint("onReconnecting called");
        connectionIsOpen = false;
      });
      _hubConnection.onreconnected(({connectionId}) {
        rapidSoftPrint("onReconnected called");
        rapidSoftPrint(_hubConnection.state);
        connectionIsOpen = true;
        if (messageSequence != "") {
          Future.delayed(
              const Duration(seconds: 2),
                  () async => {
                await _hubConnection
                    .invoke("RetrieveMessages", args: [messageSequence])
                // await _hubConnection
                //     .invoke("SendMessage", args: ["Test", "Tester"])
              });
        }
      });
      _hubConnection.on("ReceiveMessage", (args) => {rapidSoftPrint(args)});
      _hubConnection.on("SetMessageSequence", (args) {
        messageSequence = args![0] as String;
        rapidSoftPrint("messageSequence:$messageSequence");
      });

      _hubConnection.on("NotifyChanges", (args) {
        //module, moduleId, action, message, jsonData
        String module = args![0] as String;
        String moduleId = args[1] as String;
        //String action = args[2] as String;
        //String message = args[3] as String;
        messageSequence = args[5] as String; //messageSequence
        //  String jsonData = args![4] as String;

        rapidSoftPrint(args);
        int id = int.parse(moduleId);
        if (id > 0) {
          if (module.toLowerCase() == "callAction".toLowerCase() ||
              module.toLowerCase() == "call".toLowerCase() ||
              module.toLowerCase() == "callNote".toLowerCase()) {
            if (currentPage == PageName.home.name) {
              StreamControllerListener().homePageGridRefresher();
            }
          }
          // if (module.toLowerCase() == "callNote".toLowerCase()) {
          //   if (currentPage == PageName.aiCalls.name) {
          //     Get.find<AICallController>().getCallNoteByPhoneNumber();
          //   } else if (currentPage == PageName.callDetails.name) {
          //     Get.find<CallDetailsController>().getCallNoteByCallId(id);
          //     Get.find<CallDetailsController>().getCallDetailsByCallID(id);
          //   }
          // }
          // if (module.toLowerCase() == "callAction".toLowerCase()) {
          //   if (currentPage == PageName.callDetails.name) {
          //     Get.find<CallDetailsController>().getCallActionByCallId(id);
          //   }
          // }
          // if (module.toLowerCase() == "department".toLowerCase()) {
          //   Get.find<MasterController>().getDepartmentForDropdown();
          // }
          // if (module.toLowerCase() == "callNature".toLowerCase()) {
          //   Get.find<MasterController>().getNatureForDropdown();
          // }
          // if (module.toLowerCase() == "domainValue".toLowerCase()) {
          //   Get.find<MasterController>().getDomainValue();
          // }
          // if (module.toLowerCase() == "role".toLowerCase()) {
          //   Get.find<MasterController>().getRoleForDropdown();
          // }
          // if (module.toLowerCase() == "CallerAudio".toLowerCase()) {
          //   Get.find<MasterController>().getAudioForDropdown();
          // }
          //Get.find<HomeController>().onBuilderInit();
        }
      });
    }

    if (_hubConnection.state != HubConnectionState.Connected) {
      await _hubConnection.start()?.then((value) => {
        Future.delayed(const Duration(seconds: 2),
                () => {_hubConnection.invoke("MessageSequence", args: [])})
      });
      connectionIsOpen = true;
    }
  }
}
