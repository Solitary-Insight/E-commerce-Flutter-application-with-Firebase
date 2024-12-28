import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/utils/formatters/formatter.dart';

class UserModel {
  /// Construcctor for user model
  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.username,
      required this.phoneNumber,
      required this.email,
      required this.profilePicture});
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String phoneNumber;
  final String email;
  String profilePicture;

  /// Helper function to get fullname
  String get fullName => '$firstName $lastName';

  /// Helper function to get formated phone number
  String get formatedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  /// Helper function to split first name and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// Static function to generate username

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseName = '$firstName$lastName';
    String userNameWithPrefix = "sdt_$camelCaseName";
    return userNameWithPrefix;
  }

  /// Static function to get empty obj

  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      phoneNumber: '',
      email: '',
      profilePicture: '');

  /// conver model into JSON for storing in firbase

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'phoneNumber': phoneNumber,
      'email': email,
      'profilePicture': profilePicture
    };
  }

  /// Factory method to create a user model from firbase data snapshot

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return UserModel(
      id: document.id,
      firstName: data['firstName'],
      lastName: data['lastName'],
      username: data['username'],
      phoneNumber: data['phoneNumber'],
      email: data['email'],
      profilePicture: data['profilePicture'],
    );
  }
}
