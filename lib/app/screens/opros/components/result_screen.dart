import 'package:brain_task_app/app/const/app_colors.dart';
import 'package:brain_task_app/app/screens/navigator/main_navigator.dart';
import 'package:brain_task_app/app/screens/opros/opros_screen.dart';
import 'package:brain_task_app/app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String answers;
  ResultScreen({required this.answers});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 25,
                ),
                Center(
                  child: Text(
                    'Опросник',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => CustomNavigationBar()),
                          (Route<dynamic> route) => false);
                    },
                    child: Icon(Icons.close))
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 4),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Спасибо за ваши ответы!',
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(answers,
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'weglobal.io',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
