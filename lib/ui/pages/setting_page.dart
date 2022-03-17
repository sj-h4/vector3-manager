import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/vector3_button.dart';
import '../widgets/vector3_status.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        title: const Text('app'),
      ),
      body: const _BuildSettingPage(),
    );
  }
}

class _BuildSettingPage extends StatelessWidget {
  const _BuildSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(10), children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "Vector3",
            style: Theme.of(context).textTheme.headline6,
          ),
          const Vector3Status(),
          const Vector3Button(),
        ],
      ),
    ]);
  }
}
