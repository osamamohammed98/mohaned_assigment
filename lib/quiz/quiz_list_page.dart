import 'package:flutter/material.dart';
import 'package:mohaned_assigment/data/quiz_data.dart';
import 'package:mohaned_assigment/quiz/questions_page.dart';

class QuizListPage extends StatelessWidget {
  const QuizListPage({Key? key}) : super(key: key);

  static final List<QuizData> listQuizQuestions = [
    QuizData(
        "Questions One",
        "What is your grade mark in mobile computing",
        [
          "Excellent",
          "Very Good",
          "Good",
          "Satisfied",
        ],
        "Excellent",
        0 //this is a correct answer
        ),
    QuizData(
        "Questions Two",
        "What is your University Name",
        ["IUG", "IU", "PU", "AU"],
        "AU" //this is a correct answer
        ,
        0),
    QuizData(
        "Questions Three",
        "What is your best color",
        ["black", "whit", "blue", "yellow"],
        "black" //this is a correct answer
        ,
        0),
    QuizData(
        "Questions Four",
        "What is your phone type",
        ["pixel", "redmi", "iphone x", "Hawaii"],
        "Hawaii" //this is a correct answer
        ,
        0),
  ]; //questions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: const Text(
          "Quiz App",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
        itemCount: listQuizQuestions.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => InkWell(
          onTap: () => onItemClick(context, index),
          child: Container(
            width: double.infinity,
            height: 60,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepOrange,
            ),
            child: Text(
              listQuizQuestions[index].title.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }

  onItemClick(context, int index) {
    // QuestionsPage
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => QuestionsPage(
                  listQuizQuestion: listQuizQuestions[index],
                  index: index,
                )));
  }
}
