import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:suitmedia/user.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('https://reqres.in/api/users?page=1&per_page=10'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> userList = data['data'];

      setState(() {
        users = userList.map((userData) => User.fromJson(userData)).toList();
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<void> _refreshData() async {
    await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text('Third Screen', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: users.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        '${users[index].firstName} ${users[index].lastName}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('${users[index].email}'),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(users[index].avatar),
                        //size
                        radius: 32,
                      ),
                      onTap: () {
                        final selectedUserName =
                            '${users[index].firstName} ${users[index].lastName}';
                        Navigator.pop(context, selectedUserName);
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
