import 'package:flutter/material.dart';

class DasarFlutter extends StatefulWidget {
  const DasarFlutter({Key? key}) : super(key: key);

  @override
  State<DasarFlutter> createState() => _DasarFlutterState();
}

class _DasarFlutterState extends State<DasarFlutter> {
  bool isSwitch = false; // ini state awal ketika app dijalankan
  bool? isCheck = false; //  nullable boolean

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Flutter'),
        // untuk menghilangkan leading
        automaticallyImplyLeading: false,
        // custom leading
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Navigator.of(context).pop();
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              debugPrint('Info');
            },
          ),
        ],
      ),

      // body utuk isi halaman
      // Column, Row, Image
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/logo.png'),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
              height: 10,
            ),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Text Widget',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Elevated, Outline, Text Button
            ElevatedButton(
              // style untuk btn
              style: ElevatedButton.styleFrom(
                // if tenary operator
                // (kondisi) ? true : false
                primary: isSwitch ? Colors.green : Colors.blue,
              ),
              onPressed: () {
                debugPrint('Elevated Button');
              },
              child: const Text(
                'Elevated Button',
              ),
            ),
            // Outline Button
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: (isCheck == true) ? Colors.blue : Colors.green,
              ),
              onPressed: () {
                debugPrint('Outlined Button');
              },
              child: const Text(
                'Outlined Button',
              ),
            ),
            // Text Button
            TextButton(
              onPressed: () {
                debugPrint('Text Button');
              },
              child: const Text(
                'Text Button',
              ),
            ),
            // Gesture Detector
            GestureDetector(
              onTap: () {
                debugPrint('Gesture Detector');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.anchor,
                    color: Colors.blue,
                  ),
                  Text('Row Widget'),
                  Icon(
                    Icons.anchor,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),

            // Switch, Checkbox
            Switch(
              value: isSwitch, // false
              onChanged: (bool newValue) {
                setState(() {
                  isSwitch = newValue; // true
                });
              },
            ),

            // Checkbox
            Checkbox(
              value: isCheck,
              onChanged: (bool? newBool) {
                setState(() {
                  isCheck = newBool;
                });
              },
            ),

            // Image Network
            Image.network(
              'https://reqres.in/img/faces/7-image.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
