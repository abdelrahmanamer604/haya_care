import 'package:flutter/foundation.dart';

class AdminUsersController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadUsers() async {
    // TODO: Connect to AdminUsersRepository
  }
}
