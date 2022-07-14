import 'package:flutter/material.dart';
import 'package:training_flutter/dasar/root_page.dart';
import 'package:training_flutter/pages/album.dart';
import 'package:training_flutter/pages/login.dart';
import 'package:training_flutter/pages/menu.dart';
import 'package:training_flutter/pages/post_page.dart';
import 'package:training_flutter/pages/profile.dart';
import 'package:training_flutter/pages/splash_page.dart';
import 'package:training_flutter/slicing/pages/chatty.dart';

void main() {
  runApp(const MyApp());
}

// stateless widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.green
        // fonts Family
        fontFamily: 'Poppins',
      ),
      // home: const RootPage(),
      // home: const Chatty(),
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const Menu(),
        '/login': (context) => Login(),
        '/profile': (context) => Profile(),
        '/root_page': (context) => const RootPage(),
        '/chatty': (context) => const Chatty(),
        '/album': (context) => const AlbumPage(),
        '/postpage': (context) => const PostPage(),
      },
    );
  }
}
