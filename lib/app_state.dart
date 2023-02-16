import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _podcastMp3 = prefs.getString('ff_podcastMp3') ?? _podcastMp3;
    _podcastName = prefs.getString('ff_podcastName') ?? _podcastName;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _musicOnOff = false;
  bool get musicOnOff => _musicOnOff;
  set musicOnOff(bool _value) {
    _musicOnOff = _value;
  }

  String _podcastMp3 = '';
  String get podcastMp3 => _podcastMp3;
  set podcastMp3(String _value) {
    _podcastMp3 = _value;
    prefs.setString('ff_podcastMp3', _value);
  }

  String _podcastName = '';
  String get podcastName => _podcastName;
  set podcastName(String _value) {
    _podcastName = _value;
    prefs.setString('ff_podcastName', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
