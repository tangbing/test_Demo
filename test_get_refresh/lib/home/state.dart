import 'package:get/get.dart';

class HomeState {
 // HomeState() {
  // title
  final _title = "动态详情".obs;
  set title(value) => _title.value = value;
  get title => _title.value;

    var commentModels = [
      [
        GroundDynamicComments('Tom', "后来阿信也不在演唱会让人拿出手机打给喜欢的人了，可能他也知道了每个人都有那么一个爱而不得的人，不打来阿信也不在演唱会让人拿出手机打给喜欢的人了，可能他也知道了每个人都有那么一个爱而不得的人，不来阿信也不在演唱会让人拿出手机打给喜欢的人了，可能他也知道了每个人都有那么一个爱而不得的人，不扰才是最好的温柔吧。", '111', '1天前'),
        GroundDynamicComments('Jack', "后来阿信也不在演唱会让人拿出手机", '222', '2天前'),
        GroundDynamicComments('Jacky', "后来阿信也不", '333', '3天前'),
        GroundDynamicComments('Trank', "后来", '444', '4天前'),
      ],
      [
        GroundDynamicComments('Shire', "后来阿信也不在演唱会让人拿出手机打给喜欢的人了，可能他也知道了每个人都有那么一个爱而不得的人，不打来阿信也不在演唱会让人拿出手机打给喜欢的人了，可能他也知道了每个人都有那么一个爱而不得的人，不来阿信也不在演唱会让人拿出手机打给喜欢的人了，可能他也知道了每个人都有那么一个爱而不得的人，不扰才是最好的温柔吧。", '111', '1天前'),
        GroundDynamicComments('Miooon', "后来", '444', '4天前'),
      ],
    ].obs;
  //}
}

class GroundDynamicComments {
  final String userCover;
  final String userName;
  final String content;
  final String zanNum;
  final String startTime;

  GroundDynamicComments(this.userName, this.content, this.zanNum, this.startTime, {this.userCover = 'assets/images/board_info_head.png'});
}