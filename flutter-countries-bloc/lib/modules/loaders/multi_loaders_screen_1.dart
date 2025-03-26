import 'package:auto_route/auto_route.dart';
import 'package:countries_app/modules/loaders/multi_loaders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MultiLoadersScreen1 extends StatelessWidget {
  const MultiLoadersScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Loaders - 1'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: BlocProvider(
            create: (_) => MultiLoadersCubit(),
            child: BlocBuilder<MultiLoadersCubit, MultiLoaderState>(
              builder: (context, state) {
                // handle all calls
                final cubit = context.read<MultiLoadersCubit>();
                cubit.load1();
                cubit.load2();
                cubit.load3();
                cubit.load4();
                cubit.load5();

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Async call 1:"),
                        if (state.state1 == null)
                          CircularProgressIndicator()
                        else
                          Text(state.state1!),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Async call 2:"),
                        if (state.state2 == null)
                          CircularProgressIndicator()
                        else
                          Text(state.state2!),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Async call 3:"),
                        if (state.state3 == null)
                          CircularProgressIndicator()
                        else
                          Text(state.state3!),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Async call 4:"),
                        if (state.state4 == null)
                          CircularProgressIndicator()
                        else
                          Text(state.state4!),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Async call 5:"),
                        if (state.state5 == null)
                          CircularProgressIndicator()
                        else
                          Text(state.state5!),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
