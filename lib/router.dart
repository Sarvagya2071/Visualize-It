import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simulate/src/home.dart';

class PageRouter extends StatelessWidget {
  const PageRouter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Are you in 11th or 12th Standard?",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          CupertinoAlertDialog(
            actions: <Widget>[
              new CupertinoDialogAction(
                  child: const Text('Yes'),
                  isDestructiveAction: true,
                  onPressed: () {
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Home(flag: true),
                      ),
                    );
                  }),
              new CupertinoDialogAction(
                  child: const Text('No'),
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Home(flag: false),
                      ),
                    );
                  }),
            ],
          )
        ],
      ),
    );
  }
}
