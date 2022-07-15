import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:training_flutter/models/api_response.dart';
import 'package:training_flutter/helpers/constant.dart';

// get All Posts Public API
Future<ApiResponse> getPosts() async {
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.get(Uri.parse(postURL));

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.data = jsonDecode(response.body);
        break;
      case 403:
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = 'Failed to load post';
        break;
    }
  } catch (e) {
    apiResponse.error = e.toString();
  }
  return apiResponse;
}
