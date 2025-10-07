import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LeaderScreen extends StatelessWidget {
  const LeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Container(color: Colors.blue)));
  }
}
