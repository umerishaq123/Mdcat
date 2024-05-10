import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return const CircularProgressIndicator(); // Show CircularProgressIndicator on Android
    } else if (Platform.isIOS) {
      return const CupertinoActivityIndicator(); // Show CupertinoActivityIndicator on iOS
    } else {
      // Show a custom loading indicator for web or other platforms
      return const SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      );
    }
  }
}
