import 'package:api_test_task/config/colors.dart';
import 'package:flutter/material.dart';

class BexcaSnackBar {
  static SnackBar waitingMessage({required String message, int seconds = 2}) {
    return SnackBar(
      margin: const EdgeInsets.fromLTRB(15, 1, 15, 30),
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              message,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      duration: Duration(seconds: seconds),
      backgroundColor: secondMainColor,
    );
  }

  static SnackBar successMessage({required String message, int seconds = 2}) {
    return SnackBar(
      dismissDirection: DismissDirection.endToStart,
      margin: const EdgeInsets.fromLTRB(15, 1, 15, 30),
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              message,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      duration: Duration(seconds: seconds),
      backgroundColor: secondMainColor,
    );
  }

  static SnackBar errorMessage({required String message, int seconds = 5}) {
    return SnackBar(
      margin: const EdgeInsets.fromLTRB(15, 1, 15, 30),
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          const Icon(
            Icons.error,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      duration: Duration(seconds: seconds),
      backgroundColor: Colors.red.withOpacity(0.9),
    );
  }
}
