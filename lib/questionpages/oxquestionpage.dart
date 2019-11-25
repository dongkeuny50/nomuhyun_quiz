import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:audioplayers/audio_cache.dart';
class oxquestion extends StatefulWidget {
  List<String> questiontxts;
oxquestion({Key key, this.questiontxts,}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _oxquestionstate createState() => _oxquestionstate();
}
class _oxquestionstate extends State<oxquestion> {
  bool goforward = false;
  int randomnum;
  var stringindex;
  var alarmAudioPath;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    stringindex = new Random();
    int next(int min, int max) => min + stringindex.nextInt(max - min);
randomnum = ((next(0,(widget.questiontxts.length/3).toInt()))*3).toInt();

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

      body: Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(50),),
            Image(image: AssetImage('images/nomuorigin.png')),
            Padding(padding: EdgeInsets.all(50),),
            Card(

              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 3.0
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(5.0) //                 <--- border radius here
                  ),
                ),
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(QuestMaker(), textAlign: TextAlign.center,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(onPressed: () {
                          setState(() {
                            goforward = true;
                          });
                          AudioCache player = new AudioCache();
                          alarmAudioPath = "딱!.wav";
                          player.play(alarmAudioPath);
                          if(AnswerChecker()  == "o\r"){
                            Fluttertoast.showToast(
                                msg: "정답입니다!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIos: 1,
                                backgroundColor: Colors.yellow,
                                textColor: Colors.black,
                                fontSize: 16.0
                            );


                          }
                          else{
                            AudioCache player = new AudioCache();
                            alarmAudioPath = "부끄러운줄 알아야지.wav";
                            player.play(alarmAudioPath);
                            setState(() {
                              goforward = false;
                            });
                            Fluttertoast.showToast(
                                msg:"틀렸습니다.",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIos: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );

                          }

                        },
                          child: Text('O'),shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black45)
                          ),),
                        Padding(padding: EdgeInsets.all(20),),
                        RaisedButton(onPressed: () {
                          if(AnswerChecker() == "x\r"){
                            setState(() {
                              goforward = true;
                            });
                            AudioCache player = new AudioCache();
                            alarmAudioPath = "딱!.wav";
                            player.play(alarmAudioPath);
                            Fluttertoast.showToast(
                                msg: "정답입니다!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIos: 1,
                                backgroundColor: Colors.yellow,
                                textColor: Colors.black,
                                fontSize: 16.0
                            );
                          }
                          else{
                            AudioCache player = new AudioCache();
                            alarmAudioPath = "부끄러운줄 알아야지.wav";
                            player.play(alarmAudioPath);
                            setState(() {
                              goforward = false;
                            });
                            Fluttertoast.showToast(
                                msg: "틀렸습니다.",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIos: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );

                          }

                        },
                          child: Text('X'),shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black45)
                          ),),

                      ],
                    ),
                    Padding(padding: EdgeInsets.all(5),),
                    nextquiz(goforward),
                    Padding(padding: EdgeInsets.all(5),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  ////////CustomFunctions


  String QuestMaker(){
    return widget.questiontxts[randomnum];
  }

  String AnswerChecker(){
    return widget.questiontxts[randomnum +1];
  }

  String Answer(){
    return widget.questiontxts[randomnum +2];
  }

  Widget nextstage(){
    setState(() {
      stringindex = new Random();
      int next(int min, int max) => min + stringindex.nextInt(max - min);
      randomnum = ((next(0,(widget.questiontxts.length/3).toInt()))*3).toInt();
      goforward = false;
    });

  }

  Widget nextquiz(bool gonext){
    switch(gonext){
      case false:
        return
          Container();
      case true:
        return
          RaisedButton(onPressed: () {
            nextstage();
              },child: Text('다음 스테이지'),);
    }
  }

}
