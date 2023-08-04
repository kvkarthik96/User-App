import 'package:user_app/data/model/user_details_model.dart';
import 'package:user_app/data/model/user_model.dart';
import 'package:user_app/data/remote/network.dart';

class Service {
  Network network = Network();

  static String baseUrl = 'https://reqres.in/';

  Future<UserModel> getUsersListAPI({required int pageNumber}) async {
    return network
        .get("${baseUrl}api/users?page=$pageNumber")
        .then((dynamic res) {
      return UserModel.fromMap(res);
    });
  }

  Future<UserDetailsModel> getUserDetailsAPI({required int userId}) async {
    return network.get("${baseUrl}api/users/$userId").then((dynamic res) {
      return UserDetailsModel.fromMap(res);
    });
  }
}
