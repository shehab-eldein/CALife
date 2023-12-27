import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Views/Shared/consultancyWidgets.dart';
import 'package:canadianslife/Views/consultancyFormView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Consultancy2 extends StatefulWidget {
  const Consultancy2(
      {super.key, required this.nextPage, required this.prevPage});
  final Function prevPage;
  final Function nextPage;

  @override
  State<Consultancy2> createState() => _Consultancy2State();
}

class _Consultancy2State extends State<Consultancy2> {
  bool? hasBachelor;
  int? writing;
  int? speaking;
  int? reading;
  int? listening;
  setHasBachelor(value) {
    setState(() {
      hasBachelor = value;
      Consultancy.constultanceForm.hasBachelor = value;
    });
  }

  setWriting(value) {
    setState(() {
      writing = value;
      Consultancy.constultanceForm.writingRate = value;
    });
  }

  setSpeaking(value) {
    setState(() {
      speaking = value;
      Consultancy.constultanceForm.speakingRate = value;
    });
  }

  setReading(value) {
    setState(() {
      reading = value;
      Consultancy.constultanceForm.readingRate = value;
    });
  }

  setListening(value) {
    setState(() {
      listening = value;
      Consultancy.constultanceForm.listeningRate = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.center,
          child: Text(
            AppLocalizations.of(context)!.skillsEducation,
            style: const TextStyle(
              color: appDesign.colorAccent,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Image(
          image: AssetImage("images/c2.png"),
          height: 150,
          width: 50,
        ),
        const SizedBox(height: 20),
        cYesNo(
          context,
          AppLocalizations.of(context)!.gotBachelor,
          hasBachelor,
          setHasBachelor,
        ),
        Container(
          color: const Color(0xFFF5F5F5),
          child: cRate(context, AppLocalizations.of(context)!.englishSkills,
              writing, setWriting, AppLocalizations.of(context)!.writing),
        ),
        cRate(context, AppLocalizations.of(context)!.reading, reading,
            setReading, null),
        Container(
          color: const Color(0xFFF5F5F5),
          child: cRate(context, AppLocalizations.of(context)!.speaking,
              speaking, setSpeaking, null),
        ),
        cRate(context, AppLocalizations.of(context)!.listening, listening,
            setListening, null),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              height: 45,
              minWidth: Dimensions.widthPercentage(context, 45),
              onPressed: () {
                widget.prevPage();
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: appDesign.colorPrimaryDark, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                AppLocalizations.of(context)!.previous,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: appDesign.colorPrimaryDark,
                  fontSize: 18,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.widthPercentage(context, 3),
            ),
            MaterialButton(
              height: 45,
              minWidth: Dimensions.widthPercentage(context, 45),
              onPressed: () {
                widget.nextPage();
              },
              color: appDesign.colorPrimaryDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                AppLocalizations.of(context)!.next,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
