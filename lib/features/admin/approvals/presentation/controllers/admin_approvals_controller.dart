import 'package:flutter/foundation.dart';

class AdminApprovalsController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadPendingDoctors() async {
    // TODO: Connect to AdminApprovalsRepository
  }
}
