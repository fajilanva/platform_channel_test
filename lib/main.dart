import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const platform = MethodChannel('com.example/channel');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Platform Channel Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: _getNativeMessage,
            child: Text('Get Native Message'),
          ),
        ),
      ),
    );
  }

  Future<void> _getNativeMessage() async {
    try {
      final String result = await platform.invokeMethod('getNativeMessage');
      print(result);
    } on PlatformException catch (e) {
      print("Failed to get message from native code: '${e.message}'.");
    }
  }
}
