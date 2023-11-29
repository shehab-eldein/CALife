import 'package:canadianslife/Models/Topic.dart';
import 'package:canadianslife/Models/User.dart';
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
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          const ProfileInfoRow(),
          const SizedBox(height: 25),
          Post(
            topicInfo: Topic(
              id: 0,
              title: "title",
              details: "details",
              isPinned: true,
              groupId: 0,
              userId: 0,
              likesNo: 99,
              commentsNo: 99,
              user: User(
                  id: 0,
                  displayName: "displayName",
                  fullName: "fullName",
                  email: "email",
                  password: "password"),
            ),
          ),
          Post(
            topicInfo: Topic(
              id: 0,
              title: "title",
              details: "details",
              isPinned: true,
              groupId: 0,
              userId: 0,
              likesNo: 99,
              commentsNo: 99,
              user: User(
                  id: 0,
                  displayName: "displayName",
                  fullName: "fullName",
                  email: "email",
                  password: "password"),
            ),
          ),
        ],
      ),
    );
  }
}
