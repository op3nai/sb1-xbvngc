import 'package:flutter/material.dart';
import 'package:roku_remote_app/flutter_flow/flutter_flow_theme.dart';
import 'package:roku_remote_app/flutter_flow/flutter_flow_widgets.dart';

class AiSuggestPageWidget extends StatefulWidget {
  const AiSuggestPageWidget({Key? key}) : super(key: key);

  @override
  _AiSuggestPageWidgetState createState() => _AiSuggestPageWidgetState();
}

class _AiSuggestPageWidgetState extends State<AiSuggestPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'AI Suggest',
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
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Which movie hit in 2024?',
                style: FlutterFlowTheme.of(context).title3,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: FFButtonWidget(
                  onPressed: () {
                    // TODO: Implement AI suggestion functionality
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('AI suggestion not implemented yet')),
                    );
                  },
                  text: 'Get AI Recommendation',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}