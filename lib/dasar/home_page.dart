import 'package:flutter/material.dart';
import 'package:training_flutter/dasar/dasar_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const DasarFlutter(),
            ),
          );
        },
        // cara ke 2
        child: const Text('Dasar Flutter'),
      ),
    );
  }
}
