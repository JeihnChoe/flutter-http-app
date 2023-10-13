import 'package:dio/dio.dart';
import 'package:flutter_http_app/model/user.dart';

final dio = Dio(BaseOptions(baseUrl: "http://192.168.0.79:8080"));

class UserRepository {
  Future<User> fetchUser(int id) async {
    // Response<dynamic> response = await dio.get("http://192.168.0.79:8080/user");
    Response<dynamic> response = await dio.get("/user");
    print(response.data);

    Map<String, dynamic> body = response.data as Map<String, dynamic>;
    print(body["username"]);

    User user = User.fromJson(body);
    return user;
  }

  Future<List<User>> fetchUserList() async {
    //1. 통신코드
    Response<dynamic> response = await dio.get("http://192.168.0.79:8080/user");
    print(response.data);

    //2. 통신으로 받은 데이터타입 : map
    List<dynamic> bodyList = response.data as List<dynamic>;

    //3.  Map-> Object
    List<User> userList = bodyList.map((e) => User.fromJson(e)).toList();
    print(userList[0].username);

    //4. return Object
    return userList;
  }
}
//
//   List<User> fetchUserList() {
//     //1. 통신코드
//     //2. 통신으로 받은 데이터타입 : map
//     //3.  Map-> Object
//     //4. return Object
//     List<User> userList = [
//       User(id: 1, username: "ssar", password: "1234", email: "ssar@nate.com"),
//       User(id: 2, username: "cos", password: "1234", email: "cos@nate.com"),
//       User(id: 3, username: "love", password: "1234", email: "love@nate.com")
//     ];
//
//     return userList;
//   }
