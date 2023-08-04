import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  /* Singleton Class */
  static final Network _instance =  Network.internal();
  Network.internal();
  factory Network() => _instance;

  /* Json Decoder */
  final JsonDecoder _decoder = const JsonDecoder();

  /* Get Http Call */
  Future<dynamic> get(String url) async {
    return await http.get(Uri.parse(url)).then((http.Response response) async {
      final dynamic res = _decoder.convert(response.body);
      return res;
    });
  }
}
