import 'package:flutter/foundation.dart';
import 'package:haya_care/features/auth/domain/entities/user_entity.dart';

class AuthController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  UserEntity? currentUser;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setError(String? message) {
    errorMessage = message;
    notifyListeners();
  }

  void clear() {
    isLoading = false;
    errorMessage = null;
    currentUser = null;
    notifyListeners();
  }
}
