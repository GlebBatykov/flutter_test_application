import 'package:flutter/material.dart';

import '../../../model/user_card_data.dart';

class UserCard extends StatelessWidget {
  final UserCardData data;

  const UserCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16);

    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: GestureDetector(
        onTap: data.onTap,
        child: Card(
          child: SizedBox(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Username: ${data.username}',
                  style: textStyle,
                ),
                const SizedBox(height: 10),
                Text('Name: ${data.name}', style: textStyle)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
