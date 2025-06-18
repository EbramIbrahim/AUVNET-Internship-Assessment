import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveService {
  static const String _boxName = 'onboarding_box';
  static const String _isFirstTimeKey = 'is_first_time';

  HiveService();
  static Box<bool>? _box;

  // Initialize the onboarding service
  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox<bool>(_boxName);
  }

  bool get isFirstTime {
    if (_box == null) {
      throw Exception('Hive not initialized. Call Hive.init() first.');
    }
    // If the key doesn't exist, it means it's the first time
    return _box!.get(_isFirstTimeKey, defaultValue: true) ?? true;
  }

  Future<void> completeOnboarding() async {
    if (_box == null) {
      throw Exception(
        'OnboardingService not initialized. Call OnboardingService.init() first.',
      );
    }
    await _box!.put(_isFirstTimeKey, false);
  }

  Future<void> close() async {
    await _box?.close();
    _box = null;
  }
}
