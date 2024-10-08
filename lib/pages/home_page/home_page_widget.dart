import 'package:flutter/material.dart';
import 'package:roku_remote_app/flutter_flow/flutter_flow_theme.dart';
import 'package:roku_remote_app/flutter_flow/flutter_flow_widgets.dart';
import 'package:roku_remote_app/services/roku_service.dart';
import 'package:provider/provider.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final rokuService = Provider.of<RokuService>(context);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Roku Remote',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
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
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: rokuService.rokuIp == null
            ? Center(child: Text('Please set Roku IP in settings'))
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _buildRemoteControl(context),
                    _buildChannelGrid(context),
                    _buildAiSuggest(context),
                  ],
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/touchpad');
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.touch_app,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildRemoteControl(BuildContext context) {
    // Implement remote control UI here
  }

  Widget _buildChannelGrid(BuildContext context) {
    // Implement channel grid UI here
  }

  Widget _buildAiSuggest(BuildContext context) {
    // Implement AI suggest UI here
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