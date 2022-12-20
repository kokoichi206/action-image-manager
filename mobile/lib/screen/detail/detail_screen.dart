import 'package:flutter/material.dart';
import 'package:mobile/data/remote/images_api.dart';
import 'package:mobile/main.dart';
import 'package:mobile/screen/detail/detail_ui_state.dart';
import 'package:mobile/screen/detail/detail_viewmodel.dart';
import 'package:mobile/screen/detail/widget/one_image.dart';

import '../util/my_colors.dart';

class DetailScreen extends StatefulWidget {
  final String userName;

  const DetailScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DetailViewModel viewModel = DetailViewModel(ImagesApi());
  late DetailUiState uiState;

  @override
  void initState() {
    uiState = viewModel.uiState;
    uiState.user = widget.userName;

    Future(() async {
      await viewModel.fetchImages();
      logger.i(uiState.imageFiles);
      setState(() {
        uiState.imageFiles;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.userName,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: primaryRed),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var chunkedImages in viewModel.chunkedImageFiles()) ...[
              Row(
                children: [
                  for (var uriImage in chunkedImages) ...[
                    Expanded(
                      flex: 5,
                      child: OneImage(
                        uriFile: uriImage,
                        onTapped: () async {
                          await viewModel.getImageFromGalley(uriImage);
                          setState(() {
                            uriImage;
                          });
                        },
                      ),
                    )
                  ],
                ],
              )
            ]
          ],
        ),
      ),
    );
  }
}
