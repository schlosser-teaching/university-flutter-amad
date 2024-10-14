class NullSafetyTest {
  String notNullString;

  NullSafetyTest(this.notNullString);
  // Alternativ:
  // NullSafetyTest({required this.notNullString});

  void test() {
    // notNullString = null; // Fehler!
  }
}

class NotNullSafetyTest {
  String? nullString;

  // Optional:
  NotNullSafetyTest({this.nullString});

  void test() {
    // print(nullString.toUpperCase()); // Fehler!
    String notNullString = nullString!;
    nullString ??= '';
    print(nullString ?? 'Kein Wert.');
    print(nullString?.toUpperCase());
  }
}