import 'dart:convert';
import 'package:incheg_events/helpers/network_helper.dart';

class User {
  int id;
  String? name, email, phone, sin, resp_promoter ;
  bool? eligibility_status;

  User({
    required this.id,
    this.name,
    this.phone,
    this.sin,
    this.eligibility_status,
    this.resp_promoter,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
      id: data['id'] as int,
      name: data['name'] as String?,
      phone: data['phone'] as String?,
      eligibility_status: data['eligibility_status'] as bool?,
      sin: data['sin'] as String?,
      resp_promoter: data['resp_promoter'] as String?
  );

  static Future<dynamic> register(Map<String, dynamic> data) async {
    const  String url = 'api/register';
    try {
      print("user data before post request $data");
      final response = await Network().post(url, json.encode(data));
      return response;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  static Future<dynamic> login(Map data) async {
    print(" this is data for post request $data");
    const String url = 'api/login';
    try {
      final response = await Network().post(url, json.encode(data));
      return response;
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> getUserDetails()  async {
    const url = 'api/profile';
    try {
      final response = await Network().get(url);
      print(response);
      return response;
    } catch (e) {
      throw e;
    }
  }


  static Future<dynamic> resetPassword(Map<String, dynamic> data) async {
    const url = 'api/check_user_account';
    Map<String, dynamic> userData = {'email': data['email']};
    try {
      print("data before request $data");
      final response = await Network().post(url, userData);
      print(response.body);
      return response;
    } catch (e) {
      throw e;
    }
  }

  static Future<dynamic> setNewPassword(data) async {
    Map<String, dynamic> userData = {
      'email': data['email'],
      'password': data['password']
    };
    const url = 'api/set_new_password';
    try {
      final response = await Network().post(url, userData);
      return response;
    } catch (e) {
      throw e;
    }
  }
}