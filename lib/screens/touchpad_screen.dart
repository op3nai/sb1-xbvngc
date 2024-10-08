import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/roku_service.dart';

class TouchpadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rokuService = Provider.of<RokuService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Navigation Touchpad')),
      body: GestureDetector(
        onPanUpdate: (details) {
          final dx = details.delta.dx;
          final dy = details.delta.dy;
          if (dx.abs() > dy.abs()) {
            if (dx > 0) {
              rokuService.pressButton('Right');
            } else {
              rokuService.pressButton('Left');
            }
          } else {
            if (dy > 0) {
              rokuService.pressButton('Down');
            } else {
              rokuService.pressButton('Up');
            }
          }
        },
        onTap: () {
          rokuService.pressButton('Select');
        },
        child: Container(
          color: Colors.grey[900],
          child: Center(
            child: Text('Swipe to navigate, tap to select', style: TextStyle(fontSize: 24)),
          ),
        ),
      ),
    );
  }
}