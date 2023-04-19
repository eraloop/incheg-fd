import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
//set data into shared preferences like this
  Future<void> setUser(
      {required int id,
        String? token,
        String? name,
        String? email,
        String? phone,
        bool? eligibility_status,
        String? resp_promoter,
        String? sin})
  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('token', token!);
    prefs.setString("email", email!) ?? '';
    prefs.setString("phone", phone!);
    prefs.setString("name", name!);
    prefs.setBool("bio", eligibility_status!);
    prefs.setString("sin", sin!);
    prefs.setString("resp_promoter", resp_promoter!);
    prefs.setBool("isLoggedIn", true);

  }

  Future<String> getFullName() async  {
    String full_name =  (await this.getFirstName() +" "+await this.getLastName());
    return full_name;
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", "");
    prefs.setString("email", "");
    prefs.setString("profile", "");
    prefs.setString("phone", "");
    prefs.setString("firstname", "");
    prefs.setString("lastname", "");
    prefs.setBool("isLoggedin", false);
  }

// a function to logout user based on my current user model saved in shared preference
  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userData");
    prefs.remove("token");
    prefs.setBool("isLoggedIn", false);
  }

  Future<bool> isLoggedin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("isLoggedIn") ?? false;
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? '';
  }
  Future<void> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

//disable First time on app
  Future<void> setFirstime(bool val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isFirstTime", val);
  }

//get First time on app
  Future<bool> isFirstime() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("isFirstTime") ?? true;
  }

  Future<String> getFirstName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String firstname = pref.getString("firstname") ?? "";
    return firstname;
  }

  Future<String> getLastName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String lastname = pref.getString("lastname") ?? "";
    return lastname;
  }

  Future<String> getEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String email = pref.getString("email") ?? "";
    return email;
  }

  Future<String> getProfile() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String profile = pref.getString("profile") ?? "";
    return profile;
  }

  Future<void> updateProfile(
      String firstname, String lastname, String bio) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("firstname", firstname);
    prefs.setString("lastname", lastname);
    prefs.setString("bio", bio);
  }

  Future<void> setNotificationsSettings({notifications, messages, replies, reminder_email, feedback_email, news_letter}) async{
    print("notifications reaching session manager $replies");
    print("messages = $messages, \nreplies = $replies, \nreminder_email = $reminder_email, \nfeedback_email = $feedback_email, \nnews_letter = $news_letter");
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if(notifications != null) {prefs.setInt("notifications", notifications);}
    if(messages != null) {prefs.setInt("messages", messages);}
    if(replies != null) {prefs.setInt("replies", replies);}
    if(reminder_email != null) {prefs.setInt("reminder_emails", reminder_email);}
    if(feedback_email != null) {prefs.setInt("feedback_emails", feedback_email);}
    if(news_letter != null) {prefs.setInt("news_letter", news_letter);}
  }

  Future<dynamic> getNotificationsSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic result = {
      'notifications': prefs.getInt("notifications") ?? 1 ,
      'messages': prefs.getInt("messages") ?? 1,
      'replies': prefs.getInt('replies') ?? 1,
      'reminder_emails': prefs.getInt('reminder_emails') ?? 1,
      'feedback_emails': prefs.getInt('feedback_emails') ?? 1,
      'news_letter': prefs.getInt('news_letter') ?? 1
    };
    return result;
  }

  Future<bool?> allNotifications() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("notifications");
  }

}