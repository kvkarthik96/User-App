class UserModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserData>? userData;
  Support? support;

  UserModel(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.userData,
      this.support});

  UserModel.fromMap(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      userData = <UserData>[];
      json['data'].forEach((v) {
        userData!.add(UserData.fromMap(v));
      });
    }
    support = json['support'] != null ? Support.fromMap(json['support']) : null;
  }
}

class UserData {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserData({this.id, this.email, this.firstName, this.lastName, this.avatar});

  UserData.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
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
