import 'package:canadianslife/Views/Shared/postCard.dart';
import 'package:canadianslife/Views/Shared/profileInfoRow.dart';
import 'package:flutter/material.dart';

class MyPostsView extends StatefulWidget {
  const MyPostsView({super.key});

  @override
  State<MyPostsView> createState() => _MyPostsViewState();
}

class _MyPostsViewState extends State<MyPostsView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        const ProfileInfoRow(),
        const SizedBox(height: 25),
        Post(),
        Post(),
      ],
    );
  }
}
