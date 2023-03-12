import 'dart:math';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart';

// import 'package:simple_url_preview/simple_url_preview.dart';

GlobalKey<_SaltState> globalKey = GlobalKey<_SaltState>();

class SaltAnalysis extends StatefulWidget {
  @override
  _SaltAnalysisState createState() => _SaltAnalysisState();

  
}

class _SaltAnalysisState extends State<SaltAnalysis> {
  double _n = 0;
  double _d = 0;
  double k = 0;
  double offset = 0;
  bool animate = false;
  bool animating = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  openUrl() async{
    String url = "https://dazzler12.github.io/PhysicsSimulations/";
     if(kIsWeb) {
    html.window.open(url,'_self');
  } else {
    if(await canLaunch(url)) {
      launch(url);
    }
  }
  }

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      // ignore: missing_return
      builder: (_, BoxConstraints constraints) {
        if (constraints.maxWidth != 0) {
          ScreenUtil.init(
            constraints,
            context: context,
            designSize: Size(512.0, 1024.0),
            minTextAdapt: true,
          );
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                color: Color.fromARGB(255, 252, 249, 249),
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'Qualitative Inorganic Analysis',
                style: Theme.of(context).textTheme.headline6,
              ),
              centerTitle: true,
            ) ,
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.centerDocked,
            // floatingActionButton: Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Visibility(
            //     visible: animate,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         FloatingActionButton(
            //           heroTag: null,
            //           backgroundColor: Color.fromARGB(255, 218, 18, 18),
            //           child: (!animating)
            //               ? Icon(
            //                   Icons.play_arrow,
            //                   color: Colors.black,
            //                 )
            //               : Icon(
            //                   Icons.pause,
            //                   color: Colors.black,
            //                 ),
            //           onPressed: () {
            //             setState(() {
            //               animating = !animating;
            //             });
            //           },
            //         ),
            //         FloatingActionButton(
            //           heroTag: null,
            //           backgroundColor: Colors.white,
            //           child: Icon(
            //             Icons.highlight_off,
            //             color: Colors.black,
            //           ),
            //           onPressed: () {
            //             setState(() {
            //               globalKey.currentState.clearScreen();
            //             });
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // bottomNavigationBar: Visibility(
            //     visible: !isLandscape(),
            //     child: parameters(context, ScreenUtil().setHeight(1024 / 5))),
            body: Row(
              children: [
                Container(
                  width: isLandscape() ?  MediaQuery.of(context).size.width : MediaQuery.of(context).size.width/3,
                  child: Stack(
                    children: <Widget>[  //below I have added the scroll view for youtube videos
                      // CustomScrollView(
                      //           slivers: <Widget>[
                      //             // const SliverAppBar(
                      //             //   pinned: true,
                      //             //   //expandedHeight: 250.0,
                      //             //   flexibleSpace: FlexibleSpaceBar(
                      //             //     title: Text('Demo'),
                      //             //   ),
                      //             // ),
                      //             SliverGrid(
                      //               gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      //                 maxCrossAxisExtent: 200.0,
                      //                 mainAxisSpacing: 10.0,
                      //                 crossAxisSpacing: 10.0,
                      //                 childAspectRatio: 4.0,
                      //               ),
                      //               delegate: SliverChildBuilderDelegate(
                      //                 (BuildContext context, int index) {
                      //                   return Container(
                      //                     alignment: Alignment.center,
                      //                     color: Colors.teal[100 * (index % 9)],
                      //                     child: Text('Grid Item $index'),
                      //                   );
                      //                 },
                      //                 childCount: 20,
                      //               ),
                      //             ),
                      //             SliverFixedExtentList(
                      //               itemExtent: 50.0,
                      //               delegate: SliverChildBuilderDelegate(
                      //                 (BuildContext context, int index) {
                      //                   return Container(
                      //                     alignment: Alignment.center,
                      //                     color: Colors.lightBlue[100 * (index % 9)],
                      //                     child: Text('List Item $index'),
                      //                   );
                      //                 },
                      //               ),
                      //             ),
                      //           ],
                      //         )

                      //Listview Added
                      // add the customize code below..
                      
                      ListView(
                          padding: const EdgeInsets.all(8),

                          children: <Widget>[
                            
                            MaterialButton(
                              color:Colors.red,
                              onPressed: ()
                              {
                                print("Hello World");
                                openUrl();
                              },child: Text("Open Link",style: TextStyle(color: Colors.white)),
                              ),

                            Container(
                              height: 50,
                              color: Colors.amber[600],
                              
                              child: const Center(child: Text('Entry A')
                              ),
                              

                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: const Center(child: Text('Entry B')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: const Center(child: Text('Entry C')),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
                // Visibility(
                //   visible: isLandscape(),
                //   child: Expanded(
                //     child: parameters(
                //       context,
                //       MediaQuery.of(context).size.height,
                //     ),
                //   ),
                // ), //container
              ], //children
            
            ),
          );
        }
      },
    );
  }

  bool isLandscape() {
    return MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height;
  }

  Container parameters(BuildContext context, num height) {
    return Container(
      height: height,
      child: Material(
        elevation: 30,
        color: Theme.of(context).primaryColor,
        child: Scrollbar(
          controller: _scrollController,
          isAlwaysShown: true,
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Slider(
                min: 0,
                max: 10,
                divisions: 1000,
                activeColor: Theme.of(context).colorScheme.secondary,
                inactiveColor: Colors.grey,
                onChanged: (value) {
                  setState(() {
                    _n = double.parse(value.toStringAsFixed(2));
                  });
                },
                value: _n,
              ),
              Center(
                child: Text(
                  "Numerator: $_n",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              Slider(
                min: 0,
                max: 10,
                divisions: 1000,
                activeColor: Theme.of(context).colorScheme.secondary,
                inactiveColor: Colors.grey,
                onChanged: (value) {
                  setState(() {
                    _d = double.parse(value.toStringAsFixed(2));
                  });
                },
                value: _d,
              ),
              Center(
                child: Text(
                  "Denominator: $_d",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              Slider(
                min: 0,
                max: 1,
                divisions: 100,
                activeColor: Theme.of(context).colorScheme.secondary,
                inactiveColor: Colors.grey,
                onChanged: (value) {
                  setState(() {
                    offset = double.parse(value.toStringAsFixed(2));
                  });
                },
                value: offset,
              ),
              Center(
                child: Text(
                  "Offset: $offset",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}



class Salt extends StatefulWidget {
  Salt({
    Key key,
    @required this.d,
    @required this.n,
    @required this.c,
    @required this.animate,
    @required this.animating,
    @required this.isLandscape,
  }) : super(key: key);

  final double d;
  final double n;
  final double c;
  final bool animate;
  final bool animating;
  final bool isLandscape;

  @override
  _SaltState createState() => _SaltState();
}

class _SaltState extends State<Salt> {
  List<Offset> points = [];
  double loopi = 0;
  double r, k;
  double looplength = 2 * pi;
  double tx, ty;
  bool orientationChanged = true;

  void dispose() {
    super.dispose();
  }

  void clearScreen() {
    points.clear();
    looplength = 2 * pi * widget.d;
    looplength += loopi;
  }

  nextStep() {
    if (loopi >= looplength) {
      clearScreen();
      loopi = 0;
    }

    setState(() {
      if (!(widget.d == 0) && !(widget.d == 0 && widget.n == 0)) {
        if (loopi == 0) {
          looplength = 2 * pi * widget.d;
        }
        loopi += 0.04;
        k = widget.n / widget.d;
        points.add(Offset(r * (cos(k * loopi) + widget.c) * cos(loopi),
                r * (cos(k * loopi) + widget.c) * sin(loopi))
            .translate(tx.roundToDouble(), ty.roundToDouble()));
      }
    });
    

  }


  @override
  Widget build(BuildContext context) {
    tx = widget.isLandscape
        ? MediaQuery.of(context).size.width / 3
        : MediaQuery.of(context).size.width / 2;
    ty = MediaQuery.of(context).size.height / 3;
    r = (widget.isLandscape
            ? MediaQuery.of(context).size.width / 6.2
            : MediaQuery.of(context).size.width / 4)
        .roundToDouble();

    if (widget.animating) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        nextStep();
      });
    }
    if (!(widget.isLandscape ^ orientationChanged)) {
      clearScreen();
      orientationChanged = !orientationChanged;
    }

    return Transform.scale(
      scale: widget.isLandscape ? 0.5 : 1,
      child: CustomPaint(
        painter: SaltPainter(
          widget.d,
          widget.n,
          tx.roundToDouble(),
          ty.roundToDouble(),
          r,
          widget.c,
          widget.animate,
          points,
        ),
        child: Container(),
      ),
    );

    
  }
}

class SaltPainter extends CustomPainter {
  double d, r, n, c;
  double k, transformx, transformy;
  List<Offset> points = [];
  bool animate;
  SaltPainter(this.d, this.n, this.transformx, this.transformy, this.r, this.c,
      this.animate, points) {
    k = n / d;
    this.points = new List<Offset>.from(points);
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.red;
    paint.strokeWidth = 2;
    if (!animate) {
      this.points.clear();
      for (double i = 0; i < 2 * d * pi; i += 0.01) {
        points.add(
            Offset(r * (cos(k * i) + c) * cos(i), r * (cos(k * i) + c) * sin(i))
                .translate(transformx, transformy));
      }
    }
    if (points.length > 0) {
      canvas.drawPoints(PointMode.polygon, points, paint);
    }
  }

  @override
  bool shouldRepaint(SaltPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(SaltPainter oldDelegate) => false;
}