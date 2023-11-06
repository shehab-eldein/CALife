
import 'User.dart';

class ConsultanceForm {
  int? id;
  int userId;
  User? user;
  String passportNo;
  String passportIssuer;
  String residenceCountry;
  int maritalStatus;
  int readingRate;
  int writingRate;
  int speakingRate;
  int listeningRate;
  bool hasBachelor;
  bool hasOffer;
  bool hasFriend;
  bool hasFamily;
  bool isAgree;
  int netWealth;
  String? passportImage;
  ConsultanceForm({
    this.id,
    required this.userId,
    this.user,
    required this.passportNo,
    required this.passportIssuer,
    required this.residenceCountry,
    required this.maritalStatus,
    required this.readingRate,
    required this.writingRate,
    required this.speakingRate,
    required this.listeningRate,
    required this.hasBachelor,
    required this.hasOffer,
    required this.hasFriend,
    required this.hasFamily,
    required this.isAgree,
    required this.netWealth,
    this.passportImage

  });


  factory ConsultanceForm.fromJson(Map<String, dynamic> json) {
    return ConsultanceForm(
      id: json['id'],
      userId: json["userId"],
      user: json["user"] != null ? User.fromJson(json["user"]) : null,
      passportNo: json['passportNo'],
      passportIssuer: json['passportIssuer'],
      residenceCountry: json['residenceCountry'],
      maritalStatus: json['maritalStatus'],
      readingRate: json['readingRate'],
      writingRate: json['writingRate'],
      speakingRate: json['speakingRate'],
      listeningRate: json['listeningRate'] ,
      hasBachelor: json['hasBachelor'],
      hasOffer: json['hasOffer'],
      hasFriend: json['hasFriend'],
      hasFamily: json['hasFamily'],
      isAgree: json['isAgree'],
      netWealth: json['netWealth'],
      passportImage: json['passportImage'],

    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'user': user,
    'passportNo': passportNo,
    'passportIssuer': passportIssuer,
    'residenceCountry': residenceCountry,
    'maritalStatus': maritalStatus,
    'readingRate': readingRate, // convert DateTime to string
    'writingRate': writingRate, // convert DateTime to string
    'speakingRate': speakingRate,
    'listeningRate': listeningRate,
    'hasBachelor': hasBachelor,
    'hasOffer': hasOffer,
    'hasFriend': hasFriend,
    'hasFamily': hasFamily,
    'isAgree': isAgree,
    'netWealth': netWealth,
    'passportImage': passportImage,


  };
}








