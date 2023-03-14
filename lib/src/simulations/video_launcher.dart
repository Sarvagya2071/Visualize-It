import 'package:flutter/material.dart';
import 'package:easy_web_view/easy_web_view.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

class VideoLauncher extends StatefulWidget {
  String name = "", url = "", desc="";
  VideoLauncher({this.name, this.url, this.desc});

  @override
  State<VideoLauncher> createState() => _VideoLauncherState();
}

class _VideoLauncherState extends State<VideoLauncher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toString()),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:  SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width-50,
                child: EasyWebView(
                  src: widget.url.toString(),
                  isHtml: false, // Use Html syntax
                  isMarkdown: false, // Use markdown syntax
                  convertToWidgets: false, 
                  onLoaded: () {  }, // Try to convert to flutter widgets
                  // width: MediaQuery.of(context).size.width-50,
                  // height: MediaQuery.of(context).size.width-200,
                ),
              ),
              SizedBox(height: 50,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width-300,
                  child: Text(widget.desc.toString(), style: TextStyle(fontSize: 20),), ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




