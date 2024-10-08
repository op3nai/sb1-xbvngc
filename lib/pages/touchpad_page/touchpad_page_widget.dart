import 'package:flutter/material.dart';
import 'package:roku_remote_app/flutter_flow/flutter_flow_theme.dart';
import 'package:roku_remote_app/services/roku_service.dart';
import 'package:provider/provider.dart';

class TouchpadPageWidget extends StatefulWidget {
  const TouchpadPageWidget({Key? key}) : super(key: key);

  @override
  _TouchpadPageWidgetState createState() => _TouchpadPageWidgetState();
}

class _TouchpadPageWidgetState extends State<TouchpadPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final rokuService = Provider.of<RokuService>(context);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Navigation Touchpad',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
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
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Center(
              child: Text(
                'Swipe to navigate, tap to select',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}