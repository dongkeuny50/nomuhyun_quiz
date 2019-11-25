import 'package:flutter/material.dart';
class selectquest extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _selectqueststate createState() => _selectqueststate();
}

class _selectqueststate extends State<selectquest> {

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
                      title: Text('문제1 노무현은 살아있을까?' ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(onPressed: () {},
                            child: Text('1번'),shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black45)
                          ),),
                        Padding(padding: EdgeInsets.all(20),),
                        RaisedButton(onPressed: () {},
                            child: Text('2번'),shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black45)
                          ),),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        RaisedButton(onPressed: () {},
                        child: Text('3번'),shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black45)
                          ),),
                        Padding(padding: EdgeInsets.all(20),),
                        RaisedButton(onPressed: () {},
                        child: Text('4번'),shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black45)
                          ),),

                      ],
                    ),
                    Padding(padding: EdgeInsets.all(20),),
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
}
