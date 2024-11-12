class DeclarativeTest {

  void testDeclarative() {
    final words = ['Hallo', 'liebe', 'Welt'];
    final numbers = [1, 3, 5];

    words.forEach((e) => print(e.toUpperCase())); // HALLO LIEBE WELT

    final doubled = numbers.map((e) => e * 2); // [2, 6, 10]
    final wordsWithB = words.where((e) => e.contains('b')); // ['liebe']
    final sum = numbers.reduce((a, b) => a + b); // 9
    final anyEven = numbers.any((e) => e.isEven); // false
    final allOdd = numbers.every((e) => e.isOdd); // true
  }
}