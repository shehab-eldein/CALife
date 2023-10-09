
import 'package:canadianslife/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<Login> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Card(
        elevation: 20,
        child: Container(
          decoration: BoxDecoration(     color: appDesign.colorPrimary,),
          child: FB5Row(
            classNames: 'align-items-center justify-content-center',
            children: [FB5Col(
              height: MediaQuery.of(context).size.height,
              classNames: 'col-12 col-md-9 col-lg-6',
              child: Container(

                width: double.infinity,
                decoration: BoxDecoration(
                    color: appDesign.colorPrimary,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),
                    // #login, #welcome
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const[
                          Text("Canadians Life",style: TextStyle(color: Colors.white,fontSize: 40),),
                          SizedBox(height: 10,),
                          Text("A Social Platform for all immigrants and residents of Canada",style: TextStyle(color: Colors.white,fontSize: 20),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              children: [
                                const SizedBox(height: 60,),
                                // #email, #password
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const[
                                      BoxShadow(
                                          color: Color.fromRGBO(171, 171, 171, .7),blurRadius: 20,offset: Offset(0,10)),
                                    ],
                                  ),


                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                        ),
                                        child: const TextField(
                                          decoration: InputDecoration(
                                              hintText: "Email",
                                              hintStyle: TextStyle(color: Colors.grey),
                                              border: InputBorder.none
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                        ),
                                        child: const TextField(
                                          decoration: InputDecoration(
                                              hintText: "Password",
                                              hintStyle: TextStyle(color: Colors.grey),
                                              border: InputBorder.none
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                const SizedBox(height: 40),
                                // #login
                                Container(
                                  height: 50,
                                  margin: const EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: appDesign.colorAccent
                                  ),
                                  child: const Center(
                                    child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                // #login SNS
                                const Text("Or Login With",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                const SizedBox(height: 30),
                                Row(
                                  children: [

                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black
                                          ),
                                          child: const Center(
                                            child: Text("Google",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )],
          ),
        ),
      ),
    );
  }
  }



