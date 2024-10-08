import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/roku_service.dart';
import '../widgets/remote_control.dart';
import '../widgets/channel_grid.dart';
import '../widgets/ai_suggest.dart';
import 'touchpad_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rokuService = Provider.of<RokuService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Roku Remote'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              final ip = await showDialog<String>(
                context: context,
                builder: (context) => _buildIpDialog(context, rokuService.rokuIp),
              );
              if (ip != null && ip.isNotEmpty) {
                await rokuService.setRokuIp(ip);
              }
            },
          ),
        ],
      ),
      body: rokuService.rokuIp == null
          ? Center(child: Text('Please set Roku IP in settings'))
          : SingleChildScrollView(
              child: Column(
                children: const [
                  RemoteControl(),
                  ChannelGrid(),
                  AiSuggest(),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.touch_app),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TouchpadScreen()),
          );
        },
      ),
    );
  }

  Widget _buildIpDialog(BuildContext context, String? currentIp) {
    final controller = TextEditingController(text: currentIp);
    return AlertDialog(
      title: const Text('Set Roku IP'),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Enter Roku IP address'),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: const Text('Save'),
          onPressed: () => Navigator.of(context).pop(controller.text),
        ),
      ],
    );
  }
}