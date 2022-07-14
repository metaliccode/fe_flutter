// stateful widget
import 'package:flutter/material.dart';
import 'package:training_flutter/dasar/home_page.dart';
import 'package:training_flutter/dasar/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  // ini untuk bottom nav bar
  int currentPage = 0;

  // list view
  List<Widget> pages = const [
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Training'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Tombol Tekan !');
        },
        child: const Icon(Icons.add),
      ),

      // Bottom Nagivation Bar
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
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
