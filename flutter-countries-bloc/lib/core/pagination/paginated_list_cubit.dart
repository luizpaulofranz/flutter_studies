part of 'pagination.dart';

abstract class PaginatedListCubit<T, P> extends Cubit<PaginatedListState<T>> {
  final FetchCallback<T, P> onFetch;
  final int limit;

  PaginatedListCubit({
    required this.onFetch,
    this.limit = 50,
  }) : super(PaginatedListState(isDone: false, isInited: false, items: []));

  Future<void> next(P payload) async {
    try {
      final list = await onFetch(
        FetchPayload<P>(
          extra: payload,
          limit: limit,
          skip: state.items.length,
        ),
      );

      emit(
        state.copyWith(
          isDone: list.isEmpty,
          isInited: true,
          items: List.of(state.items)..addAll(list),
        ),
      );
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        emit(state.copyWith(isDone: true, isInited: true));
        return;
      }

      rethrow;
    }
  }

  Future<void> refetch(P payload) async {
    try {
      final list = await onFetch(
        FetchPayload<P>(
          extra: payload,
          limit: limit,
          skip: 0,
        ),
      );

      emit(
        state.copyWith(
          isDone: list.isEmpty,
          isInited: true,
          items: list,
        ),
      );
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        emit(state.copyWith(isDone: true, isInited: true, items: []));
        return;
      }

      rethrow;
    }
  }
}

typedef FetchCallback<T, P> = Future<List<T>> Function(FetchPayload<P> payload);

class FetchPayload<Extra> {
  final Extra? extra;
  final int limit;
  final int skip;

  FetchPayload({required this.extra, required this.limit, required this.skip});
}

class PaginatedListState<T> {
  final bool isDone;
  final bool isInited;
  final List<T> items;

  PaginatedListState({required this.isDone, required this.isInited, required this.items});

  PaginatedListState<T> copyWith({
    bool? isDone,
    bool? isInited,
    List<T>? items,
  }) {
    return PaginatedListState(
      isDone: isDone ?? this.isDone,
      isInited: isInited ?? this.isInited,
      items: items ?? this.items,
    );
  }
}
