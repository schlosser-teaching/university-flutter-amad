class FutureTest {
  Future testVoid() async {
    print('Test');
  }

  Future<int> testInt() async {
    print('Führe testVoid() aus...');
    await testVoid();
    return 2;
  }

  void callFuture() {
    testInt()
        .then((value) => print('Ergebnis: ${value + 5}'))
        .catchError((error) => print('Fehler: ${error}'));
  }

  Future<String> timeFuture() async {
    print('Lade Text...');
    Future.delayed(const Duration(seconds: 2, milliseconds: 500));
    return 'Geladener Text!';
  }
}