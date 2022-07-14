import 'dart:io';

import 'package:training_flutter/helpers/constant.dart';
import 'package:training_flutter/models/api_response.dart';
import 'package:training_flutter/models/user_model.dart';
import 'package:training_flutter/pages/login.dart';
import 'package:training_flutter/services/user_service.dart';
import 'package:flutter/material.dart';

// import 'login.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user;
  // get user detail
  Future<void> getUser() async {
    // panggil response dari model
    ApiResponse response = await getUserDetail();
    // jika response berhasil
    if (response.error == null) {
      // masukan data ke list _postList = []
      debugPrint('Response: ${response.data}');
      setState(() {
        user = response.data as User;
      });
    } else {
      // jika gagal
      print(response.error);
    }
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('user: ${user?.name} | ${user?.email}'),
    );
  }
}
