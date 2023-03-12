import 'package:flutter/material.dart';
import 'package:simulate/src/simulations/insertion_sort.dart';
import 'axes_painter.dart';
import 'graph_painter.dart';
import 'widgets/graph_data_tile.dart';
import 'package:uuid/uuid.dart';

import 'models/graph.dart';

class GraphPlotterPage extends StatefulWidget {
  @override
  _GraphPlotterPageState createState() => _GraphPlotterPageState();
}

class _GraphPlotterPageState extends State<GraphPlotterPage> {
  double scaleFactor = 35;
  final graphs = <Graph>[];

  @override
  void initState() {
    super.initState();
    graphs.add(
      Graph(
        id: Uuid().v1(),
        color: Colors.red,
        function: 'x^3',
        isVisible: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Graph Plotter"),
        actions: <Widget>[],
      ),
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 44, 43, 43),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 2),
                    color: Color.fromARGB(246, 241, 235, 235),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: <Widget>[
                    ...graphs.map(
                      (e) => Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        child: GraphDataTile(
                          e,
                          onChange: onChange,
                          key: ValueKey<String>(e.id),
                          
                        ),

                        // color: Color.fromARGB(255, 187, 224, 255),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                      
                    ),
                    ElevatedButton(
                      child: Text('+ ADD MORE'),
                      onPressed: () {
                        setState(() {
                          graphs.add(
                            Graph(
                              id: Uuid().v1(),
                              color: Colors.blue,
                              function: 'x^3',
                              isVisible: true,
                            ),
                          );
                        });
                      },
                        style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(242, 143, 106, 245), // background
                        onPrimary: Colors.white, // foreground
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Stack(
                children: <Widget>[
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: CustomPaint(
                      isComplex: true,
                      painter: AxesPainter(scaleFactor),
                      child: Container(),
                    ),
                  ),
                  ...graphs.map(
                    (e) => Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: CustomPaint(
                        isComplex: true,
                        painter: GraphPainter(scaleFactor, e),
                        child: Container(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onChange(Graph graph) {
    final index = graphs.indexOf(graph);

    graphs.remove(graph);
    setState(() {
      graphs.insert(index, graph);
    });
  }
}
