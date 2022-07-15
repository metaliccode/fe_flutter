import 'package:flutter/material.dart';
// import 'package:training_flutter/dasar/profile_page.dart';
import 'package:training_flutter/pages/login.dart';
import 'package:training_flutter/pages/post_page.dart';
import 'package:training_flutter/pages/profile.dart';
import 'package:training_flutter/pages/slider_pages.dart';
import 'package:training_flutter/services/user_service.dart';
import 'package:training_flutter/slicing/pages/chatty.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // ini untuk bottom nav bar
  int currentPage = 0;

  // list view
  List<Widget> pages = [
    PostPage(),
    SliderPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: () {
          if (currentPage == 0) {
            return const Text('Get Global Posts');
          } else if (currentPage == 1) {
            return const Text('Slider Page');
          } else if (currentPage == 2) {
            return const Text('Profile');
          }
        }(),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              logout().then(
                (value) => {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                    (route) => false,
                  )
                },
              );
            },
          )
        ],
      ),
      // Bottom Nagivation Bar
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.production_quantity_limits_outlined),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle),
            label: '',
          ),
        ],
        // untuk destination yang dipilih
        onDestinationSelected: (int index) {
          // debugPrint('index : $index');
          setState(() {
            currentPage = index;
          });
        },
        // selected index
        selectedIndex: currentPage,
      ),

      // body
      // body: const HomePage(),
      body: pages[currentPage],
    );
  }
}
