abstract class Animal {
  final int legAmount;

  Animal(this.legAmount);

  void talk();
}

class Cat extends Animal {
  final int whiskerAmount;

  Cat(super.legAmount, this.whiskerAmount);

  Cat.withNormalLegs(this.whiskerAmount) : super(4);

  @override
  void talk() {
    print('Miau! Ich habe ${legAmount} Beine und ${whiskerAmount} Schnurrhaare.');
  }
}