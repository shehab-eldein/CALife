import 'package:canadianslife/Views/Shared/postCard.dart';
import 'package:flutter/material.dart';

import '../Managers/LayoutManager.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    final  layoutManager = LayoutManager(context);

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: layoutManager.mainHorizontalPadding()
          , vertical: 3  ),
      color: Colors.grey.shade200,
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index){
            return Post();
          }


    ),

    );
  }
}
