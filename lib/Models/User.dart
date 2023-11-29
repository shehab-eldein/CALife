class User {
  int id;
  String displayName;
  String fullName;
  bool? isActive;
  String? phone;
  int? userType;
  String email;
  String? registerationDate;
  String? lastLoginDate;
  String password;
  String? userImage;
  String? deviceToken;
  User({
    required this.id,
    required this.displayName,
    required this.fullName,
    this.isActive,
    this.phone,
    this.userType,
    required this.email,
    this.registerationDate,
    this.lastLoginDate,
    required this.password,
    this.userImage,
    this.deviceToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      displayName: json['displayName'],
      fullName: json['fullName'],
      isActive: json['isActive'],
      phone: json['phone'],
      userType: json['userType'],
      email: json['email'],
      registerationDate: json['registerationDate'],
      lastLoginDate: json['lastLoginDate'],
      password: json['password'],
      userImage: json['userImage'],
      deviceToken: json['deviceToken'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'displayName': displayName,
        'fullName': fullName,
        'isActive': isActive,
        'phone': phone,
        'userType': userType,
        'email': email,
        'registerationDate': registerationDate, // convert DateTime to string
        'lastLoginDate': lastLoginDate, // convert DateTime to string
        'password': password,
        'userImage': userImage,
        'deviceToken': deviceToken,
      };
}
