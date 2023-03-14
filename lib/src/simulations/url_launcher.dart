import 'package:flutter/material.dart';
import 'package:easy_web_view/easy_web_view.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

class UrlLauncher extends StatefulWidget {
  String name = "", url = "";
  UrlLauncher({this.name, this.url});

  @override
  State<UrlLauncher> createState() => _UrlLauncherState();
}

class _UrlLauncherState extends State<UrlLauncher> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toString()),
      ),

      body: Container(
        child:  EasyWebView(
          src: widget.url.toString(),
          isHtml: false, // Use Html syntax
          isMarkdown: false, // Use markdown syntax
          convertToWidgets: false, 
          onLoaded: () {  }, // Try to convert to flutter widgets
          
          // width: 100,
          // height: 100,
        ),
      ),
    );
  }
}




