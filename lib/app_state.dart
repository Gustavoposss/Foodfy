import 'package:flutter/material.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _carrinho = prefs.getStringList('ff_carrinho')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _carrinho;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _carrinho = [];
  List<dynamic> get carrinho => _carrinho;
  set carrinho(List<dynamic> value) {
    _carrinho = value;
    prefs.setStringList(
        'ff_carrinho', value.map((x) => jsonEncode(x)).toList());
  }

  void addToCarrinho(dynamic value) {
    carrinho.add(value);
    prefs.setStringList(
        'ff_carrinho', _carrinho.map((x) => jsonEncode(x)).toList());
  }

  void removeFromCarrinho(dynamic value) {
    carrinho.remove(value);
    prefs.setStringList(
        'ff_carrinho', _carrinho.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromCarrinho(int index) {
    carrinho.removeAt(index);
    prefs.setStringList(
        'ff_carrinho', _carrinho.map((x) => jsonEncode(x)).toList());
  }

  void updateCarrinhoAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    carrinho[index] = updateFn(_carrinho[index]);
    prefs.setStringList(
        'ff_carrinho', _carrinho.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInCarrinho(int index, dynamic value) {
    carrinho.insert(index, value);
    prefs.setStringList(
        'ff_carrinho', _carrinho.map((x) => jsonEncode(x)).toList());
  }

  double _totalCarrinho = 0.0;
  double get totalCarrinho => _totalCarrinho;
  set totalCarrinho(double value) {
    _totalCarrinho = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
