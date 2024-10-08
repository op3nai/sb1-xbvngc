import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RokuService extends ChangeNotifier {
  String? _rokuIp;
  String? get rokuIp => _rokuIp;

  RokuService() {
    loadSavedIp();
  }

  Future<void> setRokuIp(String ip) async {
    _rokuIp = ip;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('roku_ip', ip);
    notifyListeners();
  }

  Future<void> loadSavedIp() async {
    final prefs = await SharedPreferences.getInstance();
    _rokuIp = prefs.getString('roku_ip');
    notifyListeners();
  }

  Future<void> sendCommand(String command) async {
    if (_rokuIp == null) {
      throw Exception('Roku IP not set');
    }
    final url = Uri.parse('http://$_rokuIp:8060/$command');
    try {
      await http.post(url);
    } catch (e) {
      print('Error sending command: $e');
    }
  }

  Future<void> pressButton(String button) async {
    await sendCommand('keypress/$button');
  }

  Future<void> launchChannel(String channelId) async {
    await sendCommand('launch/$channelId');
  }
}