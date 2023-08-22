// ignore_for_file: constant_identifier_names

enum ViewState { BUSY, FREE }

class BaseList<T> {
  late ViewState _viewState;
  int pageIndex = 1;
  bool isNextPage = false;
  final listData = [];
  late DateTime lastReload;
  bool cache = false;

  setList(List<T> list, int limit) {
    if (pageIndex == 1) {
      listData.clear();
    }
    if (list.length == limit) {
      isNextPage = true;
    } else {
      isNextPage = false;
    }
    listData.addAll(list);
  }

  int getListLength() {
    if (isNextPage) return listData.length + 1;
    return listData.length;
  }

  bool canLoadMore(int index, int length) {
    return (isNextPage && index == length - 1);
  }

  refreshPage() {
    pageIndex = 1;
  }

  increasePage() {
    pageIndex += 1;
  }

  requestFinished() {
    _viewState = ViewState.FREE;
  }

  requestStarted() {
    _viewState = ViewState.BUSY;
  }

  bool isRequesting() {
    return (_viewState == ViewState.BUSY);
  }
}
