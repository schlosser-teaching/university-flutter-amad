class Person {
  final String name;
  int _age;

  Person(this.name, this._age);

  void set age(int age) {
    if (age < 0) return;
    _age = age;
  }

  int get age => _age;

  void sayHello() {
    print('Ich bin ${name} und ${_age} Jahre alt.');
  }
}