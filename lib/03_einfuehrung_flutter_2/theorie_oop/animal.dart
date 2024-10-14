abstract class Animal {
  final int legAmount;

  Animal(this.legAmount);

  void talk();
}

class Cat extends Animal {
  final int whiskerAmount;

  Cat(int legAmount, this.whiskerAmount) : super(legAmount);

  @override
  void talk() {
    print('Miau! Ich habe ${legAmount} Beine und ${whiskerAmount} Schnurrhaare.');
  }
}