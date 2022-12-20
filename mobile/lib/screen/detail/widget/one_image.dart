import 'package:flutter/material.dart';
import 'package:mobile/screen/util/images_manager.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../main.dart';

class OneImage extends StatelessWidget {
  final UriFile uriFile;
  final Function() onImageTapped;
  final Function(int) onNumberChanged;

  const OneImage({
    Key? key,
    required this.uriFile,
    required this.onImageTapped,
    required this.onNumberChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        logger.i("user: ${uriFile.fileName} is tapped.");
        onImageTapped();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
        child: SizedBox(
          width: double.infinity,
          child: Column(children: [
            NumberPicker(
              minValue: 0,
              maxValue: 100,
              value: uriFile.actionNumber,
              onChanged: (value) => onNumberChanged(value),
              axis: Axis.horizontal,
              itemCount: 1,
            ),
            Image.file(uriFile.file),
          ]),
        ),
      ),
    );
  }
}
