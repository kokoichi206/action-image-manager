import 'package:flutter/material.dart';
import 'package:mobile/data/remote/images_api.dart';
import 'package:mobile/screen/main_list/widget/one_user.dart';

import 'list_ui_state.dart';
import 'list_viewmodel.dart';

class MainListScreen extends StatefulWidget {
  const MainListScreen({Key? key}) : super(key: key);

  @override
  State<MainListScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainListScreen> {
  // TODO: 適切に DI を行う。
  ListViewModel viewModel = ListViewModel(ImagesApi());
  late ListUiState uiState;

  @override
  void initState() {
    uiState = viewModel.uiState;
    Future(() async {
      await viewModel.fetchUsers();
      setState(() {
        uiState.users;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "設定画面",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            for (var user in uiState.users ?? []) ...[
              OneUser(user: user),
            ]
          ],
        ),
      ),
    );
  }
}
