import 'package:brain_task_app/app/const/app_colors.dart';
import 'package:brain_task_app/app/screens/opros/opros_screen.dart';
import 'package:brain_task_app/app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';

class ZnakomsvtoScreen extends StatelessWidget {
  final String id;
  const ZnakomsvtoScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: Text(
                'Опросник',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[300],
                color: AppColors.blue,
                minHeight: 7,
                value: 0,
              ),
            ),
            SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://i.ibb.co.com/6skxJLV/725b84cb17ccdf35d5a8dc14670a8966.png',
                      ))),
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                '😱 😱 😱',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'А вы знали что',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'На сегодняшний день в Казахстане существует более 12 тысяч профессий.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            CustomButton(
              padding: 15,
              text: 'Ого!',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OprosScreen(
                            id: id,
                          )),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
