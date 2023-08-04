import 'package:user_app/data/model/user_model.dart';

class UserDetailsModel {
  UserData? userData;
  Support? support;

  UserDetailsModel({this.userData, this.support});

  UserDetailsModel.fromMap(Map<String, dynamic> json) {
    userData = json['data'] != null ? UserData.fromMap(json['data']) : null;
    support = json['support'] != null ? Support.fromMap(json['support']) : null;
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  Support.fromMap(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }
}
