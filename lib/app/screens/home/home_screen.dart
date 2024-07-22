import 'package:brain_task_app/app/const/app_colors.dart';
import 'package:brain_task_app/app/screens/home/bloc/home_bloc.dart';
import 'package:brain_task_app/app/screens/home/components/home_card.dart';
import 'package:brain_task_app/app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Задачи',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      padding: 15,
                      text: 'Записаться на консультацию',
                      unFilled: true,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          width: MediaQuery.of(context).size.width / 2.2,
                          text: 'Активные',
                        ),
                        CustomButton(
                          width: MediaQuery.of(context).size.width / 2.2,
                          text: 'Завершенные',
                          bordered: true,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return HomeCard(
                            data: state.data[index],
                          );
                        })
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
