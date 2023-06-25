import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/widgets.dart' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'pagination_state_data.g.dart';

abstract class PaginationStateData<T>
    implements Built<PaginationStateData<T>, PaginationStateDataBuilder<T>> {
  BuiltList<T> get items;

  bool get isLoading;

  bool get isFinished;

  int get currentPage;

  int get total;

  PaginationStateData._();

  factory PaginationStateData(
          [Function(PaginationStateDataBuilder<T> b) updates]) =
      _$PaginationStateData<T>;

  factory PaginationStateData.initial() => PaginationStateData<T>(
        (b) => b
          ..items.replace([])
          ..isLoading = false
          ..isFinished = false
          ..currentPage = 1
          ..total = 1,
      );

  bool paginationStateCanGetMoreData() {
    return (!isFinished && !isLoading && items.isNotEmpty) ? true : false;
  }

  bool paginationScrollControllerShouldGetMoreData({
    required ui.ScrollController scrollController,
  }) {
    return (paginationStateCanGetMoreData() &&
            scrollController.position.extentAfter <= 0 &&
            scrollController.position.pixels ==
                scrollController.position.maxScrollExtent)
        ? true
        : false;
  }

  bool paginationScrollControllerExtentNeedMoreData({
    required ui.ScrollController scrollController,
    int loaderSize = 80,
    bool isHorizontal = false,
  }) {
    return (scrollController.hasClients &&
            scrollController.position.maxScrollExtent <=
                (isHorizontal ? loaderSize.w : loaderSize.h))
        ? true
        : false;
  }

  void checkPaginationInitialExtent({
    required Function addEvent,
    required ui.ScrollController scrollController,
    bool isHorizontal = false,
    int loaderSize = 80,
  }) {
    ui.WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (paginationStateCanGetMoreData() &&
            paginationScrollControllerExtentNeedMoreData(
              scrollController: scrollController,
              isHorizontal: isHorizontal,
              loaderSize: loaderSize,
            )) {
          addEvent();
        }
      },
    );
  }
}
