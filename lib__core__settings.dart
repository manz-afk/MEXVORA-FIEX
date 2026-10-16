import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  static final AppSettings i = AppSettings();
  ThemeMode mode = ThemeMode.light;
  int seed = 0;
  bool anim = true;
  bool offline = true;
  static const seeds = [Color(0xFF2A8C86), Color(0xFFF5A623), Color(0xFF6C63FF), Color(0xFFE5484D), Color(0xFF3B82F6)];

  Future<void> load() async {
    final p = await SharedPreferences.getInstance();
    mode = ThemeMode.values[(p.getInt('mode') ?? 1).clamp(0, 2)];
    seed = (p.getInt('seed') ?? 0).clamp(0, seeds.length - 1);
    anim = p.getBool('anim') ?? true;
    offline = p.getBool('offline') ?? true;
  }

  Future<void> reload() async {
    await load();
    notifyListeners();
  }

  Future<void> _save() async {
    final p = await SharedPreferences.getInstance();
    await p.setInt('mode', mode.index);
    await p.setInt('seed', seed);
    await p.setBool('anim', anim);
    await p.setBool('offline', offline);
    notifyListeners();
  }

  Future<void> setMode(ThemeMode m) { mode = m; return _save(); }
  Future<void> setSeed(int s) { seed = s; return _save(); }
  Future<void> setAnim(bool a) { anim = a; return _save(); }
  Future<void> setOffline(bool o) { offline = o; return _save(); }
}
