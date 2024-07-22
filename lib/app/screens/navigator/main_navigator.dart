import 'package:brain_task_app/app/const/app_colors.dart';
import 'package:brain_task_app/app/screens/navigator/bloc/main_navigator_bloc.dart';
import 'package:brain_task_app/app/screens/navigator/components/navigator_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainNavigatorBloc, MainNavigatorState>(
      builder: (context, state) {
        if (state is MainNavigatorLoaded) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.bgColor,
            body: Column(
              children: [
                Expanded(child: state.screens[state.index]),
                Container(
                  height: 80,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          BlocProvider.of<MainNavigatorBloc>(context)
                              .add(MainNavigatorChangePage(index: 0));
                        },
                        child: NavigationItem(
                            assetImage: 'assets/icons/dashboard.svg',
                            isSelected: (state.index == 0) ? true : false,
                            text: 'Главная'),
                      ),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<MainNavigatorBloc>(context)
                              .add(MainNavigatorChangePage(index: 1));
                        },
                        child: NavigationItem(
                            assetImage: 'assets/icons/workers.svg',
                            isSelected: (state.index == 1) ? true : false,
                            text: 'Задачи'),
                      ),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<MainNavigatorBloc>(context)
                              .add(MainNavigatorChangePage(index: 2));
                        },
                        child: NavigationItem(
                            assetImage: 'assets/icons/payment.svg',
                            isSelected: (state.index == 2) ? true : false,
                            text: 'ЧатБот'),
                      ),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<MainNavigatorBloc>(context)
                              .add(MainNavigatorChangePage(index: 3));
                        },
                        child: NavigationItem(
                            assetImage: 'assets/icons/settings.svg',
                            isSelected: (state.index == 3) ? true : false,
                            text: "Ресурсы"),
                      ),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<MainNavigatorBloc>(context)
                              .add(MainNavigatorChangePage(index: 4));
                        },
                        child: NavigationItem(
                            assetImage: 'assets/icons/settings.svg',
                            isSelected: (state.index == 4) ? true : false,
                            text: "Профиль"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
