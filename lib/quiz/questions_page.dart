import 'package:flutter/material.dart';
import 'package:mohaned_assigment/data/quiz_data.dart';
import 'package:mohaned_assigment/quiz/quiz_list_page.dart';
import 'package:mohaned_assigment/quiz/score_page.dart';
import 'package:mohaned_assigment/quiz/switch_btn.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage(
      {Key? key, required this.listQuizQuestion, required this.index})
      : super(key: key);
  final QuizData listQuizQuestion;
  final int index;

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  bool? isSuccess;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: Text(
          widget.listQuizQuestion.title.toString(),
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: const[
          SwitchBtn()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.listQuizQuestion.desc.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            if (isSuccess != null)
              Text(
                isSuccess! ? "Success" : "fail",
                style: TextStyle(
                    color: isSuccess! ? Colors.green : Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
            ListView.builder(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
              itemCount: widget.listQuizQuestion.answer?.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                onTap: () => onItemClick(context, index,
                    widget.listQuizQuestion.answer![index].toString()),
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
                    widget.listQuizQuestion.answer![index].toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onItemClick(BuildContext context, int index, String ans) {
    if (ans == widget.listQuizQuestion.ansCorrect) {
      QuizListPage.listQuizQuestions[widget.index].score = 10;
      setState(() {
        isSuccess = true;
      });
      if (widget.index + 1 <= 3) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => QuestionsPage(
                      listQuizQuestion:
                          QuizListPage.listQuizQuestions[(widget.index + 1)],
                      index: (widget.index + 1),
                    )));
      } else {
        //TODO:// go to score page ScorePage
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ScorePage()));
      }
    } else {
      QuizListPage.listQuizQuestions[widget.index].score = 0;
      setState(() {
        isSuccess = false;
      });
    }
  }
}
