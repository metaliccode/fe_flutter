import 'package:flutter/material.dart';

// ini api dari global post domain jsonplaceholder
const globalURL = 'https://jsonplaceholder.typicode.com';
const albumURL = '$globalURL/albums/1';
const postURL = '$globalURL/posts';
const reqresinURL = 'https://reqres.in/api/users?page=2';

// laravel API
// const baseURL = 'http://127.0.0.1:8000/api';
// const baseURL = 'http://192.168.95.227:8000/api';
const baseURL = 'http://10.0.2.2:8000/api';
const loginURL = '$baseURL/login';
const logoutURL = '$baseURL/logout';
const userURL = '$baseURL/user';

// Errors
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';

// input decoration
InputDecoration kInputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    contentPadding: const EdgeInsets.all(10),
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Colors.black,
      ),
    ),
  );
}

// button
TextButton kTextButton(String label, Function onPressed) {
  return TextButton(
    child: Text(
      label,
      style: TextStyle(color: Colors.white),
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),
      padding: MaterialStateProperty.resolveWith(
        (states) => const EdgeInsets.symmetric(
          vertical: 10,
        ),
      ),
    ),
    onPressed: () => onPressed(),
  );
}

// loginRegisterHint
// Row kLoginRegisterHint(String text, String label, Function onTap) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text(text),
//       GestureDetector(
//         child: Text(
//           label,
//           style: TextStyle(
//             color: Colors.blue,
//           ),
//         ),
//         onTap: () => onTap(),
//       )
//     ],
//   );
// }
