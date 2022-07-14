import 'package:flutter/material.dart';
import 'package:training_flutter/slicing/theme.dart';

class ChatTile extends StatelessWidget {
  // variable dart untuk chattile
  final String imageURL;
  final String name;
  final String text;
  final String time;
  final bool unread;

  // ChatTile({
  //   this.imageURL = "",
  //   this.name = "",
  //   this.text = "",
  //   this.time = "",
  //   this.unread = false,
  // });

  const ChatTile(
      {Key? key,
      required this.imageURL,
      required this.name,
      required this.text,
      required this.time,
      required this.unread})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        children: [
          Image.asset(
            imageURL,
            height: 55,
            width: 55,
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: titleTextStyle,
              ),
              Text(
                text,
                style: unread
                    ? subTitleTextStyle.copyWith(
                        color: greenColor,
                      )
                    : subTitleTextStyle,
              ),
            ],
          ),
          const Spacer(),
          Text(
            time,
            style: subTitleTextStyle,
          ),
        ],
      ),
    );
  }
}
