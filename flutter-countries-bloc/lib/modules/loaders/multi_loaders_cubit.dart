import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

class MultiLoadersCubit extends Cubit<MultiLoaderState> {
  MultiLoadersCubit() : super(MultiLoaderState());

  Future<String> load1() async {
    await Future.delayed(const Duration(seconds: 2));
    // final data = 'First State';
    // emit(state.copyWith(state1: data));
    // return data;
    throw Exception("Exception in load1()");
  }

  Future<String> load2() async {
    await Future.delayed(const Duration(seconds: 3));
    final data = 'Second State';
    emit(state.copyWith(state2: data));
    return data;
  }

  Future<String> load3() async {
    await Future.delayed(const Duration(seconds: 5));
    // final data = 'Third State';
    // emit(state.copyWith(state3: data));
    // return data;
    throw Exception("Exception in load3()");
  }

  Future<String> load4() async {
    await Future.delayed(const Duration(seconds: 4));
    final data = 'Fourth State';
    emit(state.copyWith(state4: data));
    return data;
  }

  Future<String> load5() async {
    await Future.delayed(const Duration(seconds: 6));
    final data = 'Fifth State';
    emit(state.copyWith(state5: data));
    return data;
  }

  void changeValue() {
    emit(state.copyWith(state1: 'Changed'));
  }
}

class MultiLoaderState {
  final String? state1;
  final String? state2;
  final String? state3;
  final String? state4;
  final String? state5;

  MultiLoaderState({
    this.state1,
    this.state2,
    this.state3,
    this.state4,
    this.state5,
  });

  MultiLoaderState copyWith({
    String? state1,
    String? state2,
    String? state3,
    String? state4,
    String? state5,
  }) {
    return MultiLoaderState(
      state1: state1 ?? this.state1,
      state2: state2 ?? this.state2,
      state3: state3 ?? this.state3,
      state4: state4 ?? this.state4,
      state5: state5 ?? this.state5,
    );
  }
}
