class UserModel {
  final String uid;
  final String fullName;
  final String email;
  final String? photoUrl;  // optional profile picture URL
  final String? phoneNumber;

  UserModel({
    required this.uid,
    required this.fullName,
    required this.email,
    this.photoUrl,
    this.phoneNumber,
  });

  // Factory constructor to create UserModel from Firestore document snapshot (Map)
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'] ?? '',
      fullName: data['fullName'] ?? '',
      email: data['email'] ?? '',
      photoUrl: data['photoUrl'],
      phoneNumber: data['phoneNumber'],
    );
  }

  // Convert UserModel to Map<String, dynamic> to save in Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'photoUrl': photoUrl ?? '',
      'phoneNumber': phoneNumber ?? '',
    };
  }
}
