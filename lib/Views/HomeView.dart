import 'package:flutter/material.dart';

import '../Managers/LayoutManager.dart';
import 'Shared/addPostPopUp.dart';
import 'Shared/postCard.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

void showAddPostPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AddPostPopup();
    },
  );
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: layoutManager.mainHorizontalPadding()),
        children: [
          Post(),
          Post(),
          Post(),
          Post(),
          Post(),
          Post(),
        ],
      ),
    );
  }
}
