import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/usermodel.dart';
import '../repository/database_repository/databasemanager.dart';

class UserProvider with ChangeNotifier {
  late User _user;
  User get getUser => _user;

  void setuser(User? user)
  {
    _user = user!;
    notifyListeners();
  }


  late UserDataModel _userdata;
  UserDataModel get getUserData => _userdata;

  final DatabaseManager _databaseManager = DatabaseManager();

  Future refreshuser() async {
    UserDataModel userDataModel = await _databaseManager.getuserdetails();
    _userdata = userDataModel;
    notifyListeners();
  }
}
