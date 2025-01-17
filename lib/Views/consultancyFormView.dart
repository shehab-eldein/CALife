import 'dart:convert';

import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Models/ConsultanceForm.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'consultancyView1.dart';
import 'consultancyView2.dart';
import 'consultancyView3.dart';

class Consultancy {
  static ConsultanceForm constultanceForm = ConsultanceForm(
    id: 0,
    userId: 0,
    passportNo: "passportNo",
    passportIssuer: "passportIssuer",
    residenceCountry: "residenceCountry",
    maritalStatus: 0,
    readingRate: 0,
    writingRate: 0,
    speakingRate: 0,
    listeningRate: 0,
    hasBachelor: false,
    hasOffer: false,
    hasFriend: false,
    hasFamily: false,
    isAgree: false,
    netWealth: 0,
    passportImage: "",
  );
}

class ConsultancyView extends StatefulWidget {
  const ConsultancyView({super.key});

  @override
  State<ConsultancyView> createState() => _ConsultancyViewState();
}

class _ConsultancyViewState extends State<ConsultancyView> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  nextPage() {
    setState(() {
      if (_currentPage == 3 - 1) {
      } else {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  prevPage() {
    setState(() {
      if (_currentPage == 3 - 0) {
      } else {
        _currentPage--;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  submit() async {
    final Uri uri = Uri.parse(
      "https://tender-chandrasekhar.38-100-170-33.plesk.page/Consultancy/ConsultancyAdd",
    );
    var res = await http.post(
      uri,
      body: jsonEncode(Consultancy.constultanceForm.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(json.decode(res.body));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              height: 10,
              width: context.screenWidth,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Container(
                  width: context.screenWidth * 0.3,
                  height: 10,
                  margin: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.01),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                    color: _currentPage >= 0
                        ? appDesign.colorPrimaryDark
                        : Colors.white,
                    border:
                        Border.all(color: appDesign.colorPrimaryDark, width: 1),
                  ),
                ),
                Container(
                  width: context.screenWidth * 0.3,
                  height: 10,
                  margin: EdgeInsets.symmetric(
                      horizontal: layoutManager.valuesHandler(4, 4, 15, 15)),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                    color: _currentPage >= 1
                        ? appDesign.colorPrimaryDark
                        : Colors.white,
                    border:
                        Border.all(color: appDesign.colorPrimaryDark, width: 1),
                  ),
                ),
                Container(
                  width: context.screenWidth * 0.3,
                  height: 10,
                  margin: EdgeInsets.symmetric(
                      horizontal: layoutManager.valuesHandler(4, 4, 15, 15)),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                    color: _currentPage >= 2
                        ? appDesign.colorPrimaryDark
                        : Colors.white,
                    border:
                        Border.all(color: appDesign.colorPrimaryDark, width: 1),
                  ),
                ),
              ]),
            ),
          ),
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: 3,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return index == 0
                    ? Consultancy1(
                        nextPage: nextPage,
                      )
                    : index == 1
                        ? Consultancy2(
                            nextPage: nextPage,
                            prevPage: prevPage,
                          )
                        : Consultancy3(
                            submit: submit,
                            prevPage: prevPage,
                          );
              },
            ),
          ),
        ],
      ),
    );
  }
}
