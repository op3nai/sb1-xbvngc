import 'package:flutter/material.dart';

class AiSuggestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AI Suggest')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Which movie hit in 2024?', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Get AI Recommendation'),
              onPressed: () {
                // AI recommendation logic would go here
              },
            ),
          ],
        ),
      ),
    );
  }
}