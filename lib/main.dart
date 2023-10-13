import 'package:flutter/material.dart';
import 'package:flutter_http_app/model/user.dart';
import 'package:flutter_http_app/repository/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListPage(),
    );
  }
}

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
        future: UserRepository().fetchUserList(),
        builder: (context, snapshot) {
          print(
              "그림그려짐!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          if (snapshot.hasData) {
            // 스냅샷에 데이터가 있다. 통신이 끝남.
            List<User> userList = snapshot.data ?? [];

            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: Text("${userList[index].id}"),
                      title: Text("${userList[index].username}"),
                      subtitle: Text("${userList[index].password}"));
                });
          } else {
            // 스냅샷에 데이터가 없다. 통신이 아직 안끝남.
            return Center(
              child: Image.asset("assets/loading.gif"),
            );
          }
        },
      ),
    );
  }
}
