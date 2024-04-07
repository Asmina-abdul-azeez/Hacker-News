
class UserAuth{

  UserAuth({this.token, this.loggedInType});

  factory UserAuth.fromMap(Map<String, dynamic> map) {
    return UserAuth(
      token: (map['token']??'') as String,
      loggedInType: (map['loggedInType']??'') as String,
    );
  }
  String? token;
  String? loggedInType;

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'loggedInType': loggedInType,
    };
  }
}
