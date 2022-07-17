import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

import 'home.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Poseidon.instance.navigationKey,
      scaffoldMessengerKey: Poseidon.instance.scaffoldMessengerKey,
      title: 'test_application',
      home: const Home(),
    );
  }
}
