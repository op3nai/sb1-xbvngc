import 'package:flutter/material.dart';

class ChannelsScreen extends StatelessWidget {
  final List<String> channels = [
    'Netflix', 'HBO Max', 'Hulu', 'YouTube',
    'NBC', 'Prime Video', 'Apple TV', 'Vidio', 'NBA'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TV Channels')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
        ),
        itemCount: channels.length,
        itemBuilder: (context, index) {
          return Card(
            child: Center(child: Text(channels[index])),
          );
        },
      ),
    );
  }
}