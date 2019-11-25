import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:nomuhyun_quiz/questionpages/mainpage.dart';
import 'package:nomuhyun_quiz/questionpages/oxquestionpage.dart';
import 'package:nomuhyun_quiz/questionpages/selectquestionpage.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
List<String> quests = [];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AudioCache player = new AudioCache();
    const alarmAudioPath = "퀴즈.mp3";
    player.play(alarmAudioPath);
     loadAsset().then((String s){ quests=  s.split("\n");

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

      body: Stack(
        children: <Widget>[
          Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Container(
              color: Colors.amberAccent,
              alignment: Alignment.center,
              height:  MediaQuery.of(context).size.height,
              child: Image(image: AssetImage('images/nomuorigin.png'),height: MediaQuery.of(context).size.height,),
            ),
          ),
          Container(
            alignment: Alignment(0,0.5),
            child: Container(alignment: Alignment.center,
              height: 50,
              width: 200,
              child: Text('노무현 상식퀴즈',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
            ),
          ),
          Container(
            alignment: Alignment(0,0.7),
            child: RaisedButton(color: Colors.white,
              shape: RoundedRectangleBorder(

                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)
              ),
              onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => oxquestion(
                  questiontxts: quests,
                )),);},
              child: Container(alignment: Alignment.center,
                height: 50,
                width: 200,
                child:Text('탭하여 시작하기',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ),
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/oxquiz.txt');
  }

}
