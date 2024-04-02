import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mobileapp/constant/app_constants.dart';
import 'package:mobileapp/constant/color_constants.dart';

import '../custom_widget/alert_message.dart';
import '../model/response/api_checker.dart';
import '../repository/signalrrepo.dart';

//
// class EntryScreen extends StatelessWidget {
//   const EntryScreen({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Entry Screen'),
//       // ),
//       body: Container(
//         decoration: const BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: Color(0xFFFF6666), // Set your desired color here
//               width: 30.0, // Set the height of the bottom color
//             ),
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Get.toNamed('/production');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: pmdButtonColor,
//                 ),
//                 child: const Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//                   child: Text('Production Entry'),
//                 ),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               SizedBox(
//                 width: 180,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Get.toNamed('/quality');
//                   },
//                   style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.white,
//                       backgroundColor: pmdButtonColor),
//                   child: const Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//                     child: Text('Quality Entry'),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Get.toNamed('/breakDown');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: pmdButtonColor,
//                 ),
//                 child: const Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//                   child: Text('Breakdown Entry'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:mobileapp/constant/color_constants.dart';
//
// class EntryScreen extends StatelessWidget {
//   const EntryScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Entry Screen'),
//         backgroundColor: Colors.red,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Get.toNamed('/production');
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: pmdButtonColor, // Background color
//                 onPrimary: Colors.white, // Text color
//                 minimumSize: const Size(150, 50), // Button size
//               ),
//               child: const Text('Production Entry'),
//             ),
//             const SizedBox(
//               height: 70,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Get.toNamed('/quality');
//                 // Navigate to quality entry screen
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: pmdButtonColor, // Background color
//                 onPrimary: Colors.white, // Text color
//                 minimumSize: const Size(150, 50), // Button size
//               ),
//               child: const Text('Quality Entry'),
//             ),
//             const SizedBox(
//               height: 70,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Get.toNamed('/breakDown');
//                 // Navigate to breakdown entry screen
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: pmdButtonColor, // Background color
//                 onPrimary: Colors.white, // Text color
//                 minimumSize: const Size(150, 50), // Button size
//               ),
//               child: const Text('Breakdown Entry'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class EntryScreen extends StatelessWidget {
  const EntryScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool exit = await showDialog(
          context: context,
          builder: (context) => const ExitAlertDialog(),
        );
        return exit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Entry Screen'),
          backgroundColor: Colors.red,
          actions: [
            IconButton(
              onPressed: () {
                ApiChecker().functionAlert(
                  "Logout",
                  "Are you sure want to Logout?",
                  () {
                    SignalRRepo.terminateConnection();
                    //Navigator.pushNamed(context, '/login');
                  },
                );
              },
              icon: const Icon(
                FontAwesomeIcons.powerOff,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Select the Entry Screen?',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 80),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/production');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  minimumSize: const Size(350, 50),
                ),
                child: const Text('Production Entry',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 70,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/quality');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  minimumSize: const Size(350, 50),
                ),
                child: const Text('Quality Entry',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 70,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/breakDown');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  minimumSize: const Size(350, 50),
                ),
                child: const Text('Breakdown Entry',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// class EntryScreen extends StatelessWidget {
//   const EntryScreen({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MasterScreen(
//       // Assuming MasterScreen provides a scaffold
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Select the Entry Screen?',
//               style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 80),
//             ElevatedButton(
//               onPressed: () => Navigator.pushNamed(context, '/production'),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 onPrimary: Colors.white,
//                 minimumSize: const Size(350, 50),
//               ),
//               child: const Text(
//                 'Production Entry',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(height: 70),
//             ElevatedButton(
//               onPressed: () => Navigator.pushNamed(context, '/quality'),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 onPrimary: Colors.white,
//                 minimumSize: const Size(350, 50),
//               ),
//               child: const Text(
//                 'Quality Entry',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(height: 70),
//             ElevatedButton(
//               onPressed: () => Navigator.pushNamed(context, '/breakDown'),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 onPrimary: Colors.white,
//                 minimumSize: const Size(350, 50),
//               ),
//               child: const Text(
//                 'Breakdown Entry',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ), child: null,
//     );
//   }
// }
