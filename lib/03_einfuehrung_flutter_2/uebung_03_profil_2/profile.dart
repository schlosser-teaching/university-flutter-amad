import 'package:flutter/material.dart';

class Profile {
  final String firstName;
  final String lastName;
  final int age;
  final String username;
  final Gender gender;

  const Profile({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.username,
    required this.gender,
  });

  Widget getFittingProfileImage({double? width}) {
    return Image.asset(
      gender == Gender.male ? 'assets/profile_male.png' : 'assets/profile_female.png',
      width: width,
    );
  }
}

enum Gender {
  male, female, other,
}