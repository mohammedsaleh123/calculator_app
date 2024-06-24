import 'package:calculator_app/bussines_logic/calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/calculator_button.dart';

class CalculateView extends StatelessWidget {
  const CalculateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => CalculatorCubit(),
          child: BlocBuilder<CalculatorCubit, String>(
            builder: (context, state) {
              final mathCubit = context.read<CalculatorCubit>();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 50,
                          child: Text(
                            mathCubit.input,
                            style: const TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.centerRight,
                          height: 100,
                          child: Text(
                            mathCubit.output,
                            style: const TextStyle(
                              fontSize: 32.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemCount: mathCubit.inputList.length,
                        itemBuilder: (context, index) => CalculatorButton(
                          text: mathCubit.inputList[index],
                          color: index == 0 ||
                                  index == 2 ||
                                  index == 3 ||
                                  index == 7 ||
                                  index == 11 ||
                                  index == 15 ||
                                  index == 19
                              ? Colors.yellow
                              : index == 1
                                  ? Colors.red
                                  : null,
                          textColor: index == 0 ||
                                  index == 1 ||
                                  index == 2 ||
                                  index == 3 ||
                                  index == 7 ||
                                  index == 11 ||
                                  index == 15 ||
                                  index == 19
                              ? Colors.black
                              : null,
                          onTap: () {
                            mathCubit.calculate(mathCubit.inputList[index]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
