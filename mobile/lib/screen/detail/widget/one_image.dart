import 'package:flutter/material.dart';
import 'package:mobile/screen/util/images_manager.dart';

import '../../../main.dart';

class OneImage extends StatelessWidget {
  final UriFile uriFile;

  const OneImage({Key? key, required this.uriFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        logger.i("user: ${uriFile.uri} is tapped.");
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
        child: SizedBox(
          width: double.infinity,
          child: Column(children: [
            Text(
              uriFile.uri,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Image.file(uriFile.file),
          ]),
        ),
      ),
    );
  }
}
