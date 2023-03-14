import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:simulate/controllers/quiz_controller.dart';

import 'package:simulate/pages/home/quiz_category_card.dart';
import 'package:simulate/pages/home/quiz_search.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List quizImages = ["5", "6", "7", "8", "9"];
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      lowerBound: 0,
      upperBound: 200,
      duration: const Duration(seconds: 200),
      vsync: this,
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'Quiz',
                style: Theme.of(context).textTheme.headline6,
              ),
              centerTitle: true,
            ),
body: Stack(
        children: [
          Container(
            
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 58, 183, 177),
                Color.fromARGB(214, 187, 255, 77),
              ]),
            ),
          ),
          SafeArea(
            
            child: SingleChildScrollView(
              
              child: Column(
                children: [
                  QuizSearchView(),
                  Obx(() {
                    
                    var categories = Get.find<QuizController>().categories;
                    return Container( 
                      width: MediaQuery.of(context).size.height , //is needed remove
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        itemBuilder: (_, index) => QuizCategoryCard(
                          categories[index],
                          image: quizImages[index % (quizImages.length)],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
