import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:incheg_events/helper/session_mananger.dart';
import 'package:incheg_events/models/user.dart';


const String baseUrl = 'http://192.168.100.23:8000/';

class HttpResource {

  Future<dynamic> get(String endpoint) async {
    var url = Uri.parse(baseUrl + endpoint);
    String token = await SessionManager().getToken();
    try {
      var response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      return response;
    } catch (error) {
      return error;
    }
  }

  Future<dynamic> post(String endpoint, dynamic userData) async {
    var url = Uri.parse(baseUrl + endpoint);
    String token = await SessionManager().getToken();
    try {
      print("data entering the post request $userData");
      final response = await http.post(url, body: userData,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }
      );
      return response;
    } catch (error, stackTrace) {
      print(error);

    }
  }

  Future<dynamic> multipartPost(String endpoint, dynamic userData) async {
    var url = Uri.parse(baseUrl + endpoint);
    String token = await SessionManager().getToken();

    try {
      var request = http.MultipartRequest('POST', Uri.parse('YOUR URL'));
      //for token
      request.headers.addAll({"Authorization": "Bearer $token"});

      for (var item in userData['photos']) {
        request.files.add(http.MultipartFile.fromString('photos', item));
      }

      //for completeing the request
      var response = await request.send();
      //for getting and decoding the response into json format
      var responsed = await http.Response.fromStream(response);
    } catch (e) {
      throw e;
    }
  }

  Future<User> put(String endpoint, dynamic userData) async {
    Uri url = Uri.parse("$baseUrl + $endpoint");
    var payload = json.encode(userData);

    try {
      var response = await http.post(url, body: payload);
      final userData = json.decode(response.body);
      // saveUser(userData['user'], userData['token']);
      return userData;
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> delete(String endpoint) async {
    Uri url = Uri.parse("$baseUrl + $endpoint");

    try {
      var response = await http.delete(url);
      return response;
    } catch (error) {
      return error;
    }
  }
}