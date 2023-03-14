import 'package:flutter/material.dart';

class QuizSearchView extends StatelessWidget {
  const QuizSearchView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      
      child: TextField(
        
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black45,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(),
          ),
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: Color.fromARGB(118, 255, 255, 255),
          ),
          suffixStyle: TextStyle(
            color: Colors.white,
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Color.fromARGB(226, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
