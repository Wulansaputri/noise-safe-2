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

  String name = "";
  String email = "";
  int totalDevice = 0;
  int connectedDevice = 0;


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