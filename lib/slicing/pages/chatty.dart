import 'package:flutter/material.dart';
import 'package:training_flutter/slicing/theme.dart';
import 'package:training_flutter/slicing/widgets/chat_tile.dart';

class Chatty extends StatelessWidget {
  const Chatty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: greenColor,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'assets/images/profile.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Sabrina Carpenter',
                  style: TextStyle(
                    fontSize: 20,
                    color: whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Travel Freelancer',
                  style: TextStyle(
                    fontSize: 16,
                    color: greyColor,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Friends',
                        style: titleTextStyle,
                      ),
                      const ChatTile(
                        imageURL: 'assets/images/friend1.png',
                        name: 'Joshuer',
                        text: 'Sorry, you’re not my ty...',
                        time: 'now',
                        unread: true,
                      ),
                      const ChatTile(
                        imageURL: 'assets/images/friend2.png',
                        name: 'Gabriella',
                        text: 'I saw it clearly and mig...',
                        time: '2:30',
                        unread: false,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Group',
                        style: titleTextStyle,
                      ),
                      const ChatTile(
                        imageURL: 'assets/images/group1.png',
                        name: 'Jakarta Fair',
                        text: 'Why does everyone ca...',
                        time: '11:11',
                        unread: true,
                      ),
                      const ChatTile(
                        imageURL: 'assets/images/group2.png',
                        name: 'Angga',
                        text: 'Here here we can go...',
                        time: '7:11',
                        unread: false,
                      ),
                      const ChatTile(
                        imageURL: 'assets/images/group3.png',
                        name: 'Bentley',
                        text: 'The car which does not...',
                        time: '7:11',
                        unread: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
