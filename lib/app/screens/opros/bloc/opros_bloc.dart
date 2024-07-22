import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:brain_task_app/app/api/api.dart';
import 'package:brain_task_app/app/screens/opros/opros_screen.dart';
import 'package:meta/meta.dart';

part 'opros_event.dart';
part 'opros_state.dart';

class OprosBloc extends Bloc<OprosEvent, OprosState> {
  OprosBloc() : super(OprosInitial()) {
    var data;
    int currentPage = 0;
    var answers = [];
    on<OprosEvent>((event, emit) async {
      if (event is OprosLoad) {
        data = await ApiClient().getById(event.id);
        if (data != null) {
          answers = [];
          for (var i = 0; i < data['data']['pages'].length; i++) {
            answers.add([]);
            answers[i] = [];
            for (var q = 0;
                q < data['data']['pages'][i]['options'].length;
                q++) {
              answers[i].add(false);
            }
          }
          emit(OprosLoaded(
              answers: answers,
              data: data['data']['pages'],
              currentPage: currentPage));
        } else {
          emit(OprosError(id: event.id));
        }
      }
      if (event is OprosNext) {
        currentPage++;
        emit(OprosLoaded(
            answers: answers,
            data: data['data']['pages'],
            currentPage: currentPage));
      }
      if (event is OprosBack) {
        currentPage--;
        emit(OprosLoaded(
            answers: answers,
            data: data['data']['pages'],
            currentPage: currentPage));
      }
      if (event is OprosSingleAnswer) {
        for (var i = 0; i < answers[currentPage].length; i++) {
          answers[currentPage][i] = false;
        }

        answers[currentPage][event.index] = true;
        emit(OprosLoaded(
            answers: answers,
            data: data['data']['pages'],
            currentPage: currentPage));
      }
      if (event is OprosNultiplyAnswer) {
        answers[currentPage][event.index] = event.val;
        emit(OprosLoaded(
            answers: answers,
            data: data['data']['pages'],
            currentPage: currentPage));
      }
      if (event is OpresFinish) {
        String selectedAnswers = '';

        for (int i = 0; i < data['data']['pages'].length; i++) {
          // Check if the current page's question type is 'checkbox'
          if (data['data']['pages'][i]['type'] == 'checkbox') {
            // Initialize a list to collect selected options for checkboxes
            List<String> selectedOptions = [];

            // Loop through the answers for the current page
            for (int q = 0; q < answers[i].length; q++) {
              // Check if the answer at index q is true (selected)
              if (answers[i][q]) {
                // Add the selected option to the list
                selectedOptions.add(data['data']['pages'][i]['options'][q]);
              }
            }

            // Concatenate selected options with '&&&' separator
            if (selectedOptions.isEmpty) {
              selectedAnswers += 'null';
            } else {
              if (selectedAnswers.isNotEmpty) {
                selectedAnswers += ',&&&';
              }
              selectedAnswers += selectedOptions.join('&&&');
            }
          } else {
            // Handle other question types (assuming 'multiple-choice' or similar)
            bool anySelected = false; // Flag to check if any option is selected

            for (int q = 0; q < answers[i].length; q++) {
              // Check if the answer at index q is true (selected)
              if (answers[i][q]) {
                anySelected = true;
                // Check if it's the first selected option, if not add a comma and space
                if (selectedAnswers.isNotEmpty) {
                  selectedAnswers += ' , ';
                }
                selectedAnswers +=
                    '"' + data['data']['pages'][i]['options'][q] + '"';
              }
            }

            // If no option is selected for 'multiple-choice', add 'null'
            if (!anySelected) {
              selectedAnswers += ',"null"';
            }
          }
        }

        emit(OprosFinish(answer: selectedAnswers));
      }
    });
  }
}
