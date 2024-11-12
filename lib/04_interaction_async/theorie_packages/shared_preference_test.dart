import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceTest {
  Future<void> testSetValue({required int value}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('my-int', value);
  }

  Future<int> testGetValue() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return (sharedPreferences.getInt('my-int')) ?? 0;
  }

  Future<void> testMethods() async {
    await testSetValue(value: 20);
    await Future.delayed(const Duration(seconds: 2));
    final value = await testGetValue();
    print('Geladener Wert: $value');
  }
}