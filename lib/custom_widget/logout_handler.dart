import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/response/api_checker.dart';
import '../repository/signalrrepo.dart';

class LogoutHandler {
  static void handleLogout(BuildContext context, VoidCallback onLogoutConfirmed) {
    ApiChecker().functionAlert(
      "Logout",
      "Are you sure want to Logout?",
          () {
        SignalRRepo.terminateConnection();
        onLogoutConfirmed(); // Execute the provided logout function
      },
    );
  }

  static Widget buildLogoutButton(BuildContext context, VoidCallback onLogoutConfirmed) {
    return IconButton(
      onPressed: () {
        handleLogout(context, onLogoutConfirmed);
      },
      icon: const Icon(
        FontAwesomeIcons.powerOff,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}