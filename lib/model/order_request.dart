
import 'package:warshatkom/model/service.dart';

class OrderRequest {
  int mobile;
  String fcmToken;
  String description;
  List<Service> services;
  String city;
  String region;
  //String other;

  OrderRequest({
    required this.mobile,
    required this.fcmToken,
    required this.description,
    required this.services,
    required this.city,
    required this.region,
  });

  factory OrderRequest.fromJson(Map<String, dynamic> json) {
    return OrderRequest(
      mobile: json['mobile'],
      fcmToken: json['fcmToken'],
      description: json['description'],
      services: json['services'],
      city: json['city'],
      region: json['region'],
    );
  }

  toJson() => {
    'mobile': mobile,
    'fcmToken': fcmToken,
    'description': description,
    'services': services,
    'city': city,
    'region': region,
  };


}