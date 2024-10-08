import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/roku_service.dart';

class RemoteControl extends StatelessWidget {
  const RemoteControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rokuService = Provider.of<RokuService>(context);

    Widget buildButton(String label, String command) {
      return ElevatedButton(
        onPressed: () => rokuService.pressButton(command),
        child: Text(label),
        style: ElevatedButton.styleFrom(primary: Colors.grey[800]),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildButton('Power', 'Power'),
              buildButton('Home', 'Home'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('←', 'Left'),
              Column(
                children: [
                  buildButton('↑', 'Up'),
                  const SizedBox(height: 10),
                  buildButton('OK', 'Select'),
                  const SizedBox(height: 10),
                  buildButton('↓', 'Down'),
                ],
              ),
              buildButton('→', 'Right'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('Back', 'Back'),
              buildButton('*', 'Info'),
              buildButton('Options', 'Options'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('Rev', 'Rev'),
              buildButton('Play', 'Play'),
              buildButton('Fwd', 'Fwd'),
            ],
          ),
        ],
      ),
    );
  }
}