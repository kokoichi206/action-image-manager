import 'package:flutter/material.dart';

import '../../../main.dart';

class OneUser extends StatelessWidget {
  final String user;

  const OneUser({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        logger.i("user: $user is tapped.");
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
        child: Text(
          user,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
