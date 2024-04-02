// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// import '../model/response/api_checker.dart';
// import '../repository/signalrrepo.dart';
// import 'alert_message.dart';
//
// class MasterScreen extends StatelessWidget {
//   final Widget child;
//
//   const MasterScreen({Key? key, required this.child}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         bool exit = await showDialog(
//           context: context,
//           builder: (context) => const ExitAlertDialog(), // Assuming ExitAlertDialog is defined elsewhere
//         );
//         return exit;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Entry Screen'),
//           backgroundColor: Colors.red,
//           actions: [
//             IconButton(
//               onPressed: () {
//                 ApiChecker().functionAlert(
//                   "Logout",
//                   "Are you sure want to Logout?",
//                       () {
//                     SignalRRepo.terminateConnection();
//                     Navigator.pushNamed(context, '/login');
//                   },
//                 );
//               },
//               icon: const Icon(
//                 FontAwesomeIcons.powerOff,
//                 color: Colors.white,
//                 size: 20,
//               ),
//             ),
//           ],
//         ),
//         body: child,
//       ),
//     );
//   }
// }
//
