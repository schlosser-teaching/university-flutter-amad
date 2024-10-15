import 'dart:ui';

class Student {
  final String firstName;
  final String lastName;
  final String seminarGroup;
  final int credits;
  final Color? favoriteColor;

  Student({
    required this.firstName,
    required this.lastName,
    required this.seminarGroup,
    required this.credits,
    this.favoriteColor,
  });

  void printInfo() {
    print('Name: $firstName $lastName');
    print('Seminargruppe: $seminarGroup ($credits Credits)');
  }
}