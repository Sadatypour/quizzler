import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'question.dart';
import 'questionbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Questionbank questionbankk = Questionbank();

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Icon> answericon = [];
  //!
  void checkanswer(bool answeruser) {
    bool correctanswer = questionbankk.getanswer();
    setState(() {
      if (questionbankk.isFinished() == true) {
        Alert(
          style: AlertStyle(
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(
                color: Color.fromRGBO(0, 179, 134, 1.0),
              ),
            ),
          ),
          context: context,
          title: 'Finished!',
          image: Image.asset("assets/images/chatting.png"),
          desc: 'You\'ve reached the end of the quiz.',
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              color: Color.fromRGBO(0, 179, 134, 1.0),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return home();
                }));
              },
              radius: BorderRadius.circular(10),
            ),
          ],
        ).show();

        questionbankk.reset();
      } else {
        if (correctanswer == answeruser) {
          answericon.add(Icon(
            Icons.check_circle,
            color: Colors.teal.shade300,
            size: 30,
          ));
        } else {
          answericon.add(Icon(
            Icons.cancel,
            color: Colors.red.shade400,
            size: 30,
          ));
        }

        questionbankk.nextquetion();
      }
    });
  }

  //!فانکشین دکمه های جواب
  ElevatedButton button(String text, bool answer) {
    return ElevatedButton(
      onPressed: () {
        checkanswer(answer);
      },
      child: Text(
        "$text",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      style: TextButton.styleFrom(
          elevation: 20,
          shadowColor: Colors.red,
          backgroundColor: Color.fromARGB(223, 255, 162, 0),
          fixedSize: Size(150, 50)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber.shade100,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/chatting.png"),
            )),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 13),
                    //todo:بخش سوال
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(105, 255, 162, 0),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(100),
                            topLeft: Radius.circular(100),
                          )),
                      width: 430,
                      height: 150,
                      child: Center(
                        child: Text(
                          questionbankk.getquestiontext(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 500,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      //todo:بخش دکمه ها
                      button("NO", false),
                      SizedBox(
                        width: 50,
                      ),
                      button("YES", true),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 43, top: 30),
                  child: Row(children: answericon
                      //todo:بخش تیک درست و غلط

                      ),
                )
              ],
            ),
          ),
        ));
  }
}
