import 'package:brain_task_app/app/screens/opros/components/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brain_task_app/app/const/app_colors.dart';
import 'package:brain_task_app/app/screens/opros/bloc/opros_bloc.dart';
import 'package:brain_task_app/app/widgets/buttons/custom_button.dart';
import 'package:brain_task_app/app/widgets/snackbars/custom_snackbar.dart';

class OprosScreen extends StatelessWidget {
  final String id;

  const OprosScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: BlocProvider(
        create: (context) => OprosBloc()..add(OprosLoad(id: id)),
        child: BlocListener<OprosBloc, OprosState>(
          listener: (context, state) {
            if (state is OprosError) {
              CustomSnackbar.show(context, 'Ошибка!');
            }
            if (state is OprosFinish) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScreen(
                          answers: state.answer,
                        )),
              );
            }
          },
          child: BlocBuilder<OprosBloc, OprosState>(
            builder: (context, state) {
              if (state is OprosError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Ошибка!'),
                      CustomButton(
                        text: 'Обновить',
                        onTap: () {
                          BlocProvider.of<OprosBloc>(context)
                              .add(OprosLoad(id: state.id));
                        },
                      ),
                    ],
                  ),
                );
              }
              if (state is OprosLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close))
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey[300],
                              color: AppColors.blue,
                              minHeight: 7,
                              value: ((1 /
                                      double.parse(
                                          (state.data.length - 1).toString())) *
                                  state.currentPage.toDouble()),
                            ),
                          ),
                          SizedBox(height: 25),
                          (state.data[state.currentPage]['type'] == 'banner')
                              ? Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            state.data[state.currentPage]
                                                ['image'],
                                          ))),
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Text(
                              state.data[state.currentPage]['question'],
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          (state.data[state.currentPage]['type'] ==
                                  'multiple-choice')
                              ? Column(
                                  children: state.data[state.currentPage]
                                          ['options']
                                      .map<Widget>((e) {
                                    int index = state.data[state.currentPage]
                                            ['options']
                                        .indexOf(e);
                                    return GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<OprosBloc>(context)
                                          ..add(
                                              OprosSingleAnswer(index: index));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 8),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.1,
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color:
                                              (state.answers[state.currentPage]
                                                          [index] ==
                                                      false)
                                                  ? AppColors.secondaryColor
                                                  : AppColors.blue,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: Text(
                                            e,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                )
                              : Column(
                                  children: state.data[state.currentPage]
                                          ['options']
                                      .map<Widget>((e) {
                                    int index = state.data[state.currentPage]
                                            ['options']
                                        .indexOf(e);
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Checkbox(
                                            value:
                                                state.answers[state.currentPage]
                                                    [index],
                                            onChanged: (val) {
                                              BlocProvider.of<OprosBloc>(
                                                  context)
                                                ..add(OprosNultiplyAnswer(
                                                    val: val!, index: index));
                                            }),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 8),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.2,
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            color: AppColors.secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: Text(
                                              e,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 58.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              padding: 15,
                              onTap: () {
                                if (state.currentPage == 0) {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                } else {
                                  BlocProvider.of<OprosBloc>(context)
                                    ..add(OprosBack());
                                }
                              },
                              text: "←",
                              width: 60,
                              unFilled: true,
                            ),
                            CustomButton(
                              padding: 15,
                              onTap: () {
                                if (state.data.length !=
                                    state.currentPage + 1) {
                                  BlocProvider.of<OprosBloc>(context)
                                    ..add(OprosNext());
                                } else {
                                  BlocProvider.of<OprosBloc>(context)
                                    ..add(OpresFinish());
                                }
                              },
                              text: (state.data.length == state.currentPage + 1)
                                  ? 'Закончить'
                                  : 'Дальше',
                              width: MediaQuery.of(context).size.width / 1.3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
