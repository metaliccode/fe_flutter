import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:training_flutter/helpers/constant.dart';
import 'package:training_flutter/models/album_model.dart';
import 'package:training_flutter/models/api_response.dart';
import 'package:training_flutter/models/reqresin.dart';
import 'package:training_flutter/services/post_service.dart';
import 'package:training_flutter/services/reqresin_service.dart';
import 'package:training_flutter/slicing/theme.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  // api Response
  List<dynamic> _reqresin = [];
  Future<void> getAllPosts() async {
    // panggil response dari model
    ApiResponse response = await getReqresin();
    // jika response berhasil
    if (response.error == null) {
      // masukan data ke list _postList = []
      debugPrint('Response: ${response.data}');
      setState(() {
        // isLoading = false;
        _reqresin = response.data as List<dynamic>;
      });
    } else {
      // jika gagal
      print(response.error);
    }
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    getAllPosts();
    super.initState();
  }

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CarouselSlider(
          // items: _reqresin.map((url) {
          //   return Container(
          //     margin: EdgeInsets.all(5.0),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.all(Radius.circular(5.0)),
          //       child: Image.network(
          //         url.avatar,
          //         fit: BoxFit.cover,
          //         width: 1000.0,
          //       ),
          //     ),
          //   );
          // }).toList(),
          items: _reqresin.map((index) {
            return Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                  '${index.avatar}',
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
              ),
            );
          }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        // Text(
        //   '${_reqresin[_current].firstName}'
        //   '${_reqresin[_current].lastName}',
        //   style: TextStyle(
        //     fontSize: 20.0,
        //     color: Colors.blue,
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _reqresin.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.blueAccent)
                        .withOpacity(
                      _current == entry.key ? 0.9 : 0.4,
                    )),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
