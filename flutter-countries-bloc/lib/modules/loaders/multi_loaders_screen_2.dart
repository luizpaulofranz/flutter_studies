import 'package:auto_route/auto_route.dart';
import 'package:countries_app/modules/loaders/multi_loaders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MultiLoadersScreen2 extends StatefulWidget {
  const MultiLoadersScreen2({super.key});

  @override
  State<MultiLoadersScreen2> createState() => _MultiLoadersScreen2State();
}

class _MultiLoadersScreen2State extends State<MultiLoadersScreen2> {
  bool loading1 = true;
  String? error1;
  late MultiLoadersCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = MultiLoadersCubit();
    cubit.load1().then((_) => setState(() => loading1 = false)).catchError((e) {
      setState(() {
        error1 = e.toString();
        loading1 = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Loaders - 2'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Async call 1:"),
                  // Here we handle this piece of state separatelly and we listen to cubit state changes
                  BlocBuilder<MultiLoadersCubit, MultiLoaderState>(
                    bloc: cubit,
                    builder: (_, state) {
                      if (loading1) {
                        return CircularProgressIndicator();
                      }

                      if (error1 != null) {
                        return Text(error1!);
                      }

                      return Text(state.state1!);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Async call 2:"),
                  FutureBuilder(
                    future: cubit.load2(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data!);
                      } else if (snapshot.hasError) {
                        return Text(
                          "Error ${snapshot.error.toString()}",
                          style: TextStyle(color: Colors.red),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Async call 3:"),
                  FutureBuilder(
                    future: cubit.load3(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data!);
                      } else if (snapshot.hasError) {
                        return Text(
                          "Error ${snapshot.error.toString()}",
                          style: TextStyle(color: Colors.red),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Async call 4:"),
                  FutureBuilder(
                    future: cubit.load4(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data!);
                      } else if (snapshot.hasError) {
                        return Text(
                          "Error ${snapshot.error.toString()}",
                          style: TextStyle(color: Colors.red),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Async call 5:"),
                  FutureBuilder(
                    future: cubit.load5(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data!);
                      } else if (snapshot.hasError) {
                        return Text(
                          "Error ${snapshot.error.toString()}",
                          style: TextStyle(color: Colors.red),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    error1 = null;
                  });
                  cubit.changeValue();
                },
                child: Text('Change State 1 via cubit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
