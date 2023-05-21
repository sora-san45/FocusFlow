import 'package:appwrite/appwrite.dart';
import 'package:focusflow/constants.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';

class AuthState extends ChangeNotifier {
  static final account = Account(client);

  login(String email, String password) async {
    try {
      var result =
          await account.createEmailSession(email: email, password: password);
      print(result);
    } catch (e) {
      print(e);
    }
  }
}
