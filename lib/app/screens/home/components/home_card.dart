import 'package:brain_task_app/app/const/app_colors.dart';
import 'package:brain_task_app/app/screens/opros/components/znakomstvo_screen.dart';
import 'package:brain_task_app/app/screens/opros/opros_screen.dart';
import 'package:brain_task_app/app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeCard extends StatelessWidget {
  final data;
  const HomeCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime randomDate = DateFormat('dd/MM/yyyy').parse(data['deadline']);
    int differenceInDays = randomDate.difference(now).inDays;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.secondaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['tag'],
            style: TextStyle(color: Colors.red),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            data['title'],
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Осталось:',
                    style: TextStyle(
                        color: Colors.grey[500], fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 254, 246, 218)),
                    child: Center(
                      child: Text(
                        differenceInDays.toString() + ' дня',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 253, 190, 3)),
                      ),
                    ),
                  ),
                ],
              ),
              CustomButton(
                text: 'Приступить',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ZnakomsvtoScreen(
                              id: data['id'],
                            )),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
