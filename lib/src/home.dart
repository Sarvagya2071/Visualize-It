import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simulate/src/custom_items/app_drawer.dart';
import 'package:simulate/src/custom_items/chemistry_page.dart';
import 'package:simulate/src/custom_items/physics_page.dart';
import 'package:simulate/src/custom_items/quiz_page.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_items/advance_page.dart';
import 'data/simulations.dart';
import 'package:provider/provider.dart';
import 'package:simulate/src/custom_items/home_page.dart';
import 'package:simulate/src/custom_items/mathematics_page.dart';
import 'package:simulate/src/custom_items/algorithms_page.dart';
import 'package:simulate/src/custom_items/simulation_card.dart';
import 'package:simulate/src/data/themedata.dart';
import 'package:universal_html/html.dart' as html;

class Home extends StatefulWidget {

  final bool flag;
  Home({this.flag});

  final List<Widget> _categoryTabs5 = [
    Tab(
      child: Text('Home'),
    ),
    /*Tab(
      child: Text('Algorithms'),
    ),*/
    Tab(
      child: Text('Mathematics'),
    ),
    Tab(
      child: Text('Physics'),
    ),
    Tab(
      child: Text('Chemistry'),
    ),
    // Tab(
    //   child: Text('Advance Concepts'),
    // ),
    Tab(
      child: Text('Quiz'),
    )
  ];

    final List<Widget> _categoryTabs6 = [
    Tab(
      child: Text('Home'),
    ),
    /*Tab(
      child: Text('Algorithms'),
    ),*/
    Tab(
      child: Text('Mathematics'),
    ),
    Tab(
      child: Text('Physics'),
    ),
    Tab(
      child: Text('Chemistry'),
    ),
    Tab(
      child: Text('Advance Concepts'),
    ),
    Tab(
      child: Text('Quiz'),
    )
  ];
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //
  openUrl() async {
    String url = "https://quizplatformonline.000webhostapp.com/dashboard.php";
    //    if(kIsWeb) {
    //     html.window.open(url,'_blank');
    // } else {
    //   if(await canLaunch(url)) {
    //     launch(url);
    //   }
    // }

    //sweetalert
    SweetAlert.show(context,
        title: "Online Quiz",
        subtitle: "Are, you want to redirect to OnlineQuiz website ?",
        confirmButtonText: "Continue",
        cancelButtonText: "Decline",
        style: SweetAlertStyle.confirm,

        // ignore: missing_return
        showCancelButton: true, onPress: (bool isConfirm) {
      if (isConfirm) {
        if (canLaunch(url) != null && url != "quizz") {
          launch(url);
          return true;
        } else {
          SweetAlert.show(context,
              style: SweetAlertStyle.error, title: "Could Not Launch");
          // return false to keep dialog
          return false;
        }
        // return false to keep dialog
      }
    });
  }

  TabController _categoryController;
  @override
  void initState() {
    super.initState();
    _categoryController = TabController(
      vsync: this,
      length: widget.flag==true ? 6 : 5,
    );
  }

  @override
  void dispose() {
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Visualize It',
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SimulationSearch(),
                );
              },
            ),
          ],
          bottom: TabBar(
            controller: _categoryController,
            isScrollable: true,
            tabs: widget.flag==true ? widget._categoryTabs6 : widget._categoryTabs5,
          ),
        ),
        body: widget.flag==true ? TabBarView(
          controller: _categoryController,
          children: <Widget>[
            HomePage(),
            //AlgorithmsPage(),
            MathematicsPage(),
            PhysicsPage(),
            ChemistryPage(),
            AdvancePage(),
            QuizPage()
          ],
        ) : TabBarView(
          controller: _categoryController,
          children: <Widget>[
            HomePage(),
            //AlgorithmsPage(),
            MathematicsPage(),
            PhysicsPage(),
            ChemistryPage(),
            // AdvancePage(),
            QuizPage()
          ],
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: SizedBox(
          // // isExtended: true,
          // width: 200.0,
          // height: 200.0,
          // child: Text('Approve'),
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(15.0))
          // ),
          // backgroundColor: Color.fromARGB(255, 76, 149, 175),
          // onPressed: () {
          // }
          width: 200.0,
          height: 40.0,
          child: FloatingActionButton(
            child: Text('Redirect To Quiz Section'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            backgroundColor: Color.fromARGB(218, 130, 244, 223),
            onPressed: () {
              openUrl();
            },
          ),
        ));
  }
}

class SimulationSearch extends SearchDelegate<SimulationCard> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final appState = Provider.of<Simulations>(context);
    return (query != '')
        ? (appState.searchSims(query).length != 0)
            ? GridView.count(
                crossAxisCount: (MediaQuery.of(context).size.width < 600)
                    ? 2
                    : (MediaQuery.of(context).size.width / 200).floor(),
                children: appState.searchSims(query),
              )
            : Container(
                child: Center(
                  child: Text(
                    "Sorry, couldn't find a simulation",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              )
        : Container(
            child: Center(
              child: Text(
                'Search for Simulations',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          );
  }
}
