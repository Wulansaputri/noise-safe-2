import 'package:flutter/material.dart';

/*
|--------------------------------------------------------------------------
| PROFILE VIEWMODEL
|--------------------------------------------------------------------------
| Handle:
| - data user
| - state
| - logic (logout, dll)
|--------------------------------------------------------------------------
*/

class ProfileViewModel extends ChangeNotifier {

  /*
  --------------------------------------------------
  DATA USER (sementara dummy dulu)
  --------------------------------------------------
  */

  String name = "Rubby Ririn";
  String email = "Rubby@gmail.com";
  int totalDevice = 1;
  int connectedDevice = 1;

  /*
  --------------------------------------------------
  LOGIC LOGOUT
  --------------------------------------------------
  */

  void logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/login",
      (route) => false,
    );
  }

  /*
  --------------------------------------------------
  UPDATE DATA (NANTI DARI API)
  --------------------------------------------------
  */

  void setUserData({
    required String newName,
    required String newEmail,
  }) {
    name = newName;
    email = newEmail;
    notifyListeners();
  }
}