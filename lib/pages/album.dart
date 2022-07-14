import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:training_flutter/helpers/constant.dart';
import 'package:training_flutter/models/album_model.dart';

// service
Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse(albumURL));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late Future<Album> futureAlbum;

  // ini untuk menampilkan data
  @override
  void initState() {
    futureAlbum = fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // return Text(snapshot.data!.id.toString());
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${snapshot.data!.id} | '),
                    Text('${snapshot.data!.userId} | '),
                    Text(snapshot.data!.title),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
