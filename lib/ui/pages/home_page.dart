import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vector3_manager_app/ui/widgets/rotation.dart';

import '../widgets/power.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Vector3'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.black,
            onPressed: () => context.go('/settings'),
          ),
        ],
      ),
      body: const _BuildHomePage(),
    );
  }
}

class _BuildHomePage extends StatelessWidget {
  const _BuildHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          SizedBox(
            height: 250,
            width: 250,
            child: Power(),
          ),
          SizedBox(
            height: 250,
            width: 250,
            child: Rotation(),
          ),
        ],
      ),
    );
  }
}
