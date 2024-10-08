import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/roku_service.dart';

class ChannelGrid extends StatelessWidget {
  const ChannelGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rokuService = Provider.of<RokuService>(context);
    final channels = [
      {'name': 'Netflix', 'id': '12'},
      {'name': 'HBO Max', 'id': '61322'},
      {'name': 'Hulu', 'id': '2285'},
      {'name': 'YouTube', 'id': '837'},
      {'name': 'Prime Video', 'id': '13'},
      {'name': 'Apple TV', 'id': '551012'},
      {'name': 'Disney+', 'id': '291097'},
      {'name': 'Spotify', 'id': '20962'},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: channels.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () => rokuService.launchChannel(channels[index]['id']!),
            child: Text(
              channels[index]['name']!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
      ),
    );
  }
}