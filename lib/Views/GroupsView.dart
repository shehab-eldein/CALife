import 'package:cached_network_image/cached_network_image.dart';
import 'package:canadianslife/Constants.dart';
import 'package:canadianslife/Models/Group.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';

class GroupsView extends StatefulWidget {
  const GroupsView({super.key});


  @override
  State<GroupsView> createState() => GroupsViewState();
}

class GroupsViewState extends State<GroupsView> {
  late List<Group>? groupsData = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
   // groupsData = (await CategoriesController().getCategories(categoryId));
   // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    groupsData?.add(new Group(id: 1, name: "Life In Canada Group", groupType: 0, locationX: 0, locationY: 0, visibility: 0, userId: 0));
  }

  @override
  Widget build(BuildContext context) {

    return   FB5Row(
            classNames: 'align-items-center justify-content-center',
            children: [
              FB5Col(
                  height: 200,
                  classNames: 'col-12 col-lg-9',

                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: appDesign.backGround,
                      ),
                      child: FB5Row(
                          classNames: 'align-items-center justify-content-center',
                          children: [
                            FB5Col(
                              height: MediaQuery.of(context).size.height,

                              classNames: 'col-12',
                                child: Center(
                                  child: groupsData == null || groupsData!.isEmpty
                                      ? Center(
                                    child: SizedBox(),
                                  )
                                      : ListView.builder(
                                    cacheExtent: 1024 * 1024 * 300,

                                    itemCount: groupsData!.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 110,
                                        child: Card( elevation: 20,color: appDesign.backGround,
                                            margin: const EdgeInsets.all(10.0),
                                            child: InkWell(
                                              onTap: () {

                                              },
                                              child:
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: FB5Row(
                                                  classNames: 'align-items-start justify-content-start',
                                                  children: [

                                                    FB5Col(
                                                        height: 20,
                                                        classNames: 'col-12',
child: Text("مجموعة للتجربة"),
                                                    ),
                                                    FB5Col(
                                                      height: 20,
                                                      classNames: 'col-12',
                                                      child: Text("عدد الاعضاء : 15"),
                                                    ),
                                                    FB5Col(
                                                      height: 30,
                                                      classNames: 'col-9',
                                                    ),
                                                    FB5Col(
                                                      height: 30,
                                                      classNames: 'col-3',
                                                      child: ElevatedButton(onPressed: () {  },
                                                      child: Text("الانضمام")),
                                                    )
                                                  ]),
                                              ),


                                            )),
                                      );
                                    },
                                  ),
                                ),
                              ),

                          ]),
                    ),
                  )
            ],

    );
  }
}
