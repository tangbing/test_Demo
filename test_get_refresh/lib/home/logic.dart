import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  int totalNum() {
    print('_buildCommentListWidget refresh');
    int totalCommentCount = 0;
    for (var commentsList in state.commentModels) {
      totalCommentCount += commentsList.length;
    }
    return totalCommentCount;
  }
}
