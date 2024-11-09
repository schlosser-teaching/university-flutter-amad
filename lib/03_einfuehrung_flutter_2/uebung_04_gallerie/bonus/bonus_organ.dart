import '../organ.dart';

class BonusOrgan extends Organ {
  final BonusOrganGroup organGroup;

  const BonusOrgan({required super.imagePath, super.name, super.description,
    this.organGroup = BonusOrganGroup.other});
}

enum BonusOrganGroup {
  cardiovascular, digestion, other
}