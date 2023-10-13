import 'package:flutter_http_app/model/user.dart';

void main() {
  // 1. User 객체만들기
  User u1 =
      User(id: 1, username: "ssar", password: "1234", email: "ssar@nate.com");

  // 2. User Map 타입 만들기
  Map<String, dynamic> u2 = {
    "id": 2,
    "username": "cos",
    "password": "1234",
    "email": "cos@nate.com"
  };

  print(u2["username"]);

  //3. map(u2) -> object(u3) 변환 (백에서 받을때)
  User u3 = User.fromJson(u2);

  //4. object(u1) -> map(u4) 변환 (백으로 보낼때)
}
