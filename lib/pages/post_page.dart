import 'package:flutter/material.dart';
import 'package:training_flutter/models/api_response.dart';
import 'package:training_flutter/services/post_service.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<dynamic> _postList = [];
  bool isLoading = true;
  // get all post from API
  Future<void> getAllPosts() async {
    // panggil response dari model
    ApiResponse response = await getPosts();
    // jika response berhasil
    if (response.error == null) {
      // masukan data ke list _postList = []
      debugPrint('Response: ${response.data}');
      setState(() {
        isLoading = false;
        _postList = response.data as List<dynamic>;
      });
    } else {
      // jika gagal
      print(response.error);
    }
  }

  @override
  void initState() {
    super.initState();
    getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (isLoading)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _postList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(_postList[index]['title']),
                    subtitle: Text(_postList[index]['body']),
                    leading: const Icon(
                      Icons.newspaper,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
