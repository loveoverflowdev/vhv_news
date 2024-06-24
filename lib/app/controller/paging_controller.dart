import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

abstract class PagingController<T> extends GetxController  {
  final Rx<RxStatus> status;
  final RxList<T> responseList;

  @protected
  int pageIndex;

  @protected
  final int pageSize;

  bool isAbleToLoadMore;

  PagingController() 
  : status = Rx<RxStatus>(RxStatus.loading()), 
    responseList = RxList<T>([]),
    pageIndex = 1,
    pageSize = 13,
    isAbleToLoadMore = true;

  @override
  void onClose() {
    status.close();
    responseList.close();
    super.onClose();
  }

  @protected
  Future<List<T>> internalGetResponseList({
    required int pageIndex,
  });

  void refreshResponseList() async {
    try {
      pageIndex = 1;
      responseList.value = await internalGetResponseList(pageIndex: pageIndex);
      status.value = RxStatus.success();

      isAbleToLoadMore = true;
      pageIndex++;
    } catch (e, stackTrace) {
      status.value = RxStatus.error(e.toString());
      e.printError(info: stackTrace.toString());
    }
  }

  void loadMoreResponseList() async {
    if (!isAbleToLoadMore) return;

    try {
      final additionalResponseList = await internalGetResponseList(pageIndex: pageIndex);

      responseList.addAll(additionalResponseList);
      status.value = RxStatus.success();

      pageIndex++;
      isAbleToLoadMore = additionalResponseList.length == pageSize;
    } catch (e, stackTrace) {
      status.value = RxStatus.error(e.toString());
      e.printError(info: stackTrace.toString());
    }
  }
}
