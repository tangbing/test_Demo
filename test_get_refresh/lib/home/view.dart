import 'package:flutter/gestures.dart';
import 'package:test_get_refresh/home/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/values/images.dart';
import 'logic.dart';
import '../routes/AppColor.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:clipboard/clipboard.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.find<HomeLogic>();
  final state = Get
      .find<HomeLogic>()
      .state;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#0F1414'),
      height: MediaQuery.of(context).size.height, // 设置合适的高度，或使用具体的高度值
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCover(),
            _buildAttention(context), // _buildSelectTimer(),
          ],
        ),
      ),
    );
  }

  Widget _buildCover() {
    return Container(
      width: 375.w,
      height: 282.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [HexColor('#0F1414'), HexColor('#0F1414')],
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 1),
          stops: const [0, 1],
        ),
        image: const DecorationImage(
            image: AssetImage(AssetsImages.groundUserHomePageBackgroundCover),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)),
      ),
      child: Stack(
        children: [
          Positioned(
              left: 18.w,
              bottom: 94.w,
              child: Container(
                width: 76.w,
                height: 76.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38.w), // 设置圆角半径
                  border: Border.all(
                      color: const Color.fromARGB(76, 77, 77, 1), // 边框颜色为黑色
                      width: 2 // 边框宽度为1像素
                  ),
                ),
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(36.w),
                    child: Image.asset(AssetsImages.boardInfoHead,
                        width: 76.w, height: 76.w, fit: BoxFit.cover),
                  )
                ]),
              )),
          Positioned(
              bottom: 130.w,
              left: 106.w,
              child: Text(
                '一只榴莲',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(24),
                    fontWeight: FontWeight.bold,
                    color: HexColor('#F5F5F2')),
              )),
          Positioned(
              bottom: 108.w,
              left: 106.w,
              child: Text.rich(
                TextSpan(
                  text: 'DAO：E71B356A-C263',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.normal,
                      color: HexColor('#F5F5F2')),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' 复制',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            fontWeight: FontWeight.normal,
                            color: HexColor('#3B94FD')),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            FlutterClipboard.copy('CfA1Ed91')
                                .then((value) => print('copy success!'));
                          }),
                  ],
                ),
              )),
          Positioned(
              bottom: 26.w,
              left: 16.w,
              child: Text(
                '粉丝',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    fontWeight: FontWeight.normal,
                    color: HexColor('#BFBDBA')),
              )),
          Positioned(
              bottom: 46.w,
              left: 16.w,
              child: Text(
                '654',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(18),
                    fontWeight: FontWeight.bold,
                    color: HexColor('#F5F5F2')),
              )),
          Positioned(
              bottom: 26.w,
              left: 70.w,
              child: Text(
                '关注',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    fontWeight: FontWeight.normal,
                    color: HexColor('#BFBDBA')),
              )),
          Positioned(
              bottom: 46.w,
              left: 70.w,
              child: Text(
                '54',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(18),
                    fontWeight: FontWeight.bold,
                    color: HexColor('#F5F5F2')),
              )),
          Positioned(
              bottom: 29.w,
              right: 16.w,
              child: Container(
                width: 64.w,
                height: 32.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.w)),
                  color: HexColor("#1D2324"),
                  border: Border.all(color: HexColor('#F6D5A4'), width: 1),
                ),
                child: Center(
                  child: Text(
                    '聊天',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        fontWeight: FontWeight.bold,
                        color: HexColor('#F6D5A4')),
                  ),
                ),
              )),
          Positioned(
              bottom: 29.w,
              right: 92.w,
              child: Container(
                width: 64.w,
                height: 32.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.w)),
                  color: HexColor("#F6D5A4"),
                ),
                child: Center(
                  child: Text(
                    '关注',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        fontWeight: FontWeight.bold,
                        color: HexColor('#050A0A')),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildAttention(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
          child: Text(
            '动态',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                fontWeight: FontWeight.bold,
                color: HexColor('#F5F5F2')),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              // 禁止内部滚动
              padding: EdgeInsets.only(top: 18.w),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.w)),
                    color: HexColor('#1D2324'),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAttentionUserInfo(context),
                      const SizedBox(height: 10),
                      Visibility(visible: true, child: _buildCollectionTitle()),
                      const SizedBox(height: 10),
                      Text(
                        '“别人稍一注意你，你就敞“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你开心扉，你觉得这是坦率，其实这是孤独。”',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.normal,
                            color: HexColor('#E5E5E3')),
                      ),
                      _buildAttentionTopic(),
                      SizedBox(height: 20.w),
                      _buildAttentionImages(),
                      SizedBox(height: 12.w),
                      _buildActivityBottom(),
                      SizedBox(height: 18.w),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Container(
                height: 12.0.w,
                color: AppColor.itmebg1,
              ),
              itemCount: 5),
        )
      ],
    );
  }

  Widget _buildCollectionTitle() {
    return Container(
      //height: 28.w,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(9)),
          color: HexColor('#292D2E')),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AssetsImages.groundSeeBoardCover, width: 20, height: 20),
          SizedBox(width: 2),
          Text(
            '敦煌古画系列：飞天',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                fontWeight: FontWeight.normal,
                color: HexColor('#F6D5A4')),
          ),
        ],
      ),
    );
  }

  Widget _buildAttentionUserInfo(BuildContext context) {
    return SizedBox(
      height: 57.w,
      width: 343.w,
      child: Stack(
        children: [
          Positioned(
              top: 18.w,
              left: 16.w,
              child: ClipOval(
                  child: InkWell(
                    child: Image.asset(
                      AssetsImages.boardInfoHead,
                      width: 39,
                      height: 39,
                      fit: BoxFit.cover,
                    ),
                    onTap: () {

                    },
                  ))),
          Visibility(
            visible: true,
            child: Positioned(
                top: 43.w,
                left: 42.w,
                child:
                Image.asset(AssetsImages.iconBoard, width: 16, height: 16)),
          ),
          Positioned(
              top: 21.w,
              left: 63.w,
              child: Text(
                '一只榴莲',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(16),
                    fontWeight: FontWeight.bold,
                    color: HexColor('#E5E5E3')),
              )),
          Positioned(
              top: 24.w,
              left: 133.w,
              height: 16.w,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      HexColor('#F6D5A4'),
                      HexColor('#EDB155'),
                    ],
                    begin: const Alignment(0, 0.5),
                    end: const Alignment(0.5, 0.5),
                    stops: const [0.0, 1.0], //[渐变起始点, 渐变结束点]
                  ),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Text(
                  '官方',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(10),
                      fontWeight: FontWeight.normal,
                      color: HexColor('#000000')),
                ),
              )),
          Positioned(
              top: 43.w,
              left: 67.w,
              child: Text(
                '2分钟前',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(12),
                    fontWeight: FontWeight.normal,
                    color: HexColor('#999794')),
              )),
          Positioned(
            top: 21.w,
            right: 12.w,
            child: GestureDetector(
                onTap: () {
                  print('aaaaa');
                  if (context != null) {
                    print(context);
                    SmartDialog.showAttach(
                      targetContext: context,
                      usePenetrate: true,
                      clickMaskDismiss: true,
                      alignment: Alignment.bottomCenter,
                      builder: (_) {
                        return Container(
                            width: 100, height: 100, color: Colors.red);
                      },
                    );
                  }
                },
                child: Image.asset(AssetsImages.mineDynamicMoreCover,
                    width: 24.w, height: 24.w)),
          ),
        ],
      ),
    );
  }

  Widget _buildAttentionTopic() {
    return Container(
      // width: 263.w,
      child: Wrap(
          alignment: WrapAlignment.start, // 控制垂直方向上的对齐方式
          spacing: 12,
          runSpacing: 2, // 控制每行之间的间距
          children: _createTopicTagChips()),
    );
  }

  Widget _buildAttentionImages() {
    return Container(
      height: 102.w,
      width: 319.w,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
                width: ((ScreenUtil().screenWidth - 56 - 12) / 3),
                height: 102,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset(AssetsImages.boardInfoHead));
          },
          separatorBuilder: (BuildContext context, int index) {
            return VerticalDivider(
              width: 6.w,
              color: AppColor.itmebg1,
            );
          },
          itemCount: 3),
    );
  }

  Widget _buildActivityBottom() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Container(
        width: 319.w,
        height: 20.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildAttionButton('赞', AssetsImages.groundAttentionFavourCover),
            _buildAttionButton('评论', AssetsImages.groundAttentionCommentCover),
            _buildAttionButton('转发', AssetsImages.groundAttentionForwardCover),
          ],
        ),
      ),
    );
  }

  Widget _buildAttionButton(String text, String iconName) {
    return Container(
      child: Row(
        children: [
          Image.asset(iconName, width: 20, height: 20),
          SizedBox(width: 4.w),
          Text(
            text,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                fontWeight: FontWeight.normal,
                color: HexColor('#BFBDBA')),
          ),
        ],
      ),
    );
  }

  List<Widget> _createTopicTagChips() {
    final chips = <Widget>[];
    ['aaaa', 'bbbb', 'ccccc'].forEach((element) {
      final chip = GestureDetector(
        child: Container(
          // color: Colors.red,
          height: 12.w,
          child: Chip(
            label: Text(
              element,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(12),
                  fontWeight: FontWeight.normal,
                  color: HexColor('#3B94FD')),
            ),
            backgroundColor: HexColor("#1D2324"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0), // 设置圆角
            ), // 将背景颜色设置为透明
          ),
        ),
        onTap: () {
          print(element);
        },
      );
      chips.add(chip);
    });
    return chips;
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: AppColor.itmebg1,
  //     appBar: AppBar(
  //       title: Text(controller.state.title,
  //           style: TextStyle(fontSize: 18.w, color: AppColor.navTitle)),
  //       toolbarHeight: 44,
  //       backgroundColor: Colors.transparent,
  //       elevation: 0,
  //       centerTitle: true,
  //     ),
  //     body: Container(
  //       height: MediaQuery
  //           .of(context)
  //           .size
  //           .height, // 设置合适的高度，或使用具体的高度值
  //       child: SingleChildScrollView(
  //         child: Column(
  //           children: [
  //             _buildAttention(),
  //             Container(color: HexColor('#050A0A'), height: 6),
  //             _buildCommentListWidget(),
  //             _buildBottomInputWidget(),
  //             Container(
  //               height: MediaQuery
  //                   .of(context)
  //                   .padding
  //                   .bottom,
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildCommentListWidget() {
  //   return GetBuilder<HomeLogic>(builder: (logic) {
  //     return Container(
  //       padding: EdgeInsets.symmetric(horizontal: 16.w),
  //       child: Column(
  //         children: [
  //           SizedBox(height: 18.w),
  //           SizedBox(
  //             child: Row(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 SizedBox(height: 24.w),
  //                 Text(
  //                   '评论',
  //                   style: TextStyle(
  //                       fontSize: ScreenUtil().setSp(16),
  //                       fontWeight: FontWeight.bold,
  //                       color: AppColor.whiteColor),
  //                 ),
  //                 SizedBox(width: 12.w),
  //                 Text(
  //                   '${controller.totalNum()}',
  //                   style: TextStyle(
  //                       fontSize: ScreenUtil().setSp(14),
  //                       fontWeight: FontWeight.normal,
  //                       color: AppColor.tabbarItemTitelDefault),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           SizedBox(height: 24.w),
  //           ListView.separated(
  //               shrinkWrap: true,
  //               physics: const NeverScrollableScrollPhysics(),
  //               itemBuilder: (context, index) {
  //                 return _buildSonListView(
  //                     controller.state.commentModels[index], index);
  //               },
  //               separatorBuilder: (BuildContext context, int index) {
  //                 return Container(height: 24.w);
  //               },
  //               itemCount: controller.state.commentModels.length)
  //         ],
  //       ),
  //     );
  //   });
  // }
  //
  // Widget _buildSonListView(List comments, int expandIdx) {
  //   //return Obx(() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       ListView.builder(
  //         //key: controller.globalKey,
  //         shrinkWrap: true,
  //         physics: const NeverScrollableScrollPhysics(),
  //         itemCount: comments.length,
  //         itemBuilder: (context, index) {
  //           return _buildCommentUserInfo(context, index, comments[index]);
  //           //return SizeTransition(sizeFactor: animation,
  //           //child:  _buildCommentUserInfo(context, index, comments[index]));
  //         },
  //       ),
  //       Visibility(
  //         visible: true,
  //         child: GestureDetector(
  //           onTap: () {
  //             print('expend on text: $expandIdx');
  //             _addCommentItem(expandIdx);
  //           },
  //           child: Text(
  //             '展开30条回复',
  //             style: TextStyle(
  //                 fontSize: ScreenUtil().setSp(14),
  //                 fontWeight: FontWeight.normal,
  //                 color: HexColor('#3B94FD')),
  //           ),
  //         ),
  //       ).marginOnly(top: 12.w, left: 72.w),
  //     ],
  //   );
  //   // });
  // }
  //
  // void _addCommentItem(int expandIdx) {
  //   var commentModelArray = controller.state.commentModels.value;
  //   //var globalKey = controller.globalKey;
  //   var model = GroundDynamicComments('TrankAdd111', "后来", '444', '4天前111');
  //   print('start count: ${commentModelArray[expandIdx].length}');
  //   // 添加评论数据
  //   commentModelArray[expandIdx].add(model);
  //
  //   // 更新评论数据
  //   controller.state.commentModels.value = commentModelArray;
  //
  //   //globalKey.currentState!.insertItem(commentmodelLength);
  //   print('end count: ${commentModelArray[expandIdx].length}');
  // }
  //
  // Widget _buildCommentUserInfo(BuildContext context, int index,
  //     GroundDynamicComments commentModel) {
  //   double leftMargin = index > 0 ? 42.w : 0.w;
  //   double coverSize = index > 0 ? 24.w : 36.w;
  //
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.only(left: leftMargin),
  //         child: Flex(direction: Axis.horizontal, children: [
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(coverSize * 0.5),
  //             child: Image.asset(commentModel.userCover,
  //                 width: coverSize, height: coverSize),
  //           ),
  //           SizedBox(width: 6.w),
  //           Expanded(
  //               flex: 1,
  //               child: Text(
  //                 commentModel.userName,
  //                 style: TextStyle(
  //                     fontSize: ScreenUtil().setSp(12),
  //                     fontWeight: FontWeight.bold,
  //                     color: AppColor.whiteColor),
  //               )),
  //           Column(
  //             children: [
  //               Image.asset(
  //                 'assets/images/ground_forward_cover@3x.png',
  //                 width: 20,
  //                 height: 20,
  //               ),
  //               Text(
  //                 commentModel.zanNum,
  //                 style: TextStyle(
  //                     fontSize: ScreenUtil().setSp(10),
  //                     fontWeight: FontWeight.normal,
  //                     color: AppColor.tabbarItemTitelDefault),
  //               ),
  //             ],
  //           )
  //         ]),
  //       ),
  //       Padding(
  //           padding: EdgeInsets.only(left: leftMargin + 30.w),
  //           child:
  //           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //             Text(
  //               commentModel.content,
  //               style: TextStyle(
  //                   fontSize: ScreenUtil().setSp(12),
  //                   fontWeight: FontWeight.normal,
  //                   color: AppColor.whiteColor),
  //             ).marginOnly(top: 22.w),
  //             Text(
  //               commentModel.startTime,
  //               style: TextStyle(
  //                   fontSize: ScreenUtil().setSp(10),
  //                   fontWeight: FontWeight.normal,
  //                   color: AppColor.tabbarItemTitelDefault),
  //             ).marginOnly(top: 12.w),
  //           ])),
  //     ],
  //   );
  // }
  //
  // Widget _buildAttention() {
  //   return Container(
  //     padding: EdgeInsets.fromLTRB(16, 12, 16, 18),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.all(Radius.circular(12.w)),
  //       color: HexColor('#0F1414'),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         _buildAttentionUserInfo(),
  //         const SizedBox(height: 10),
  //         Visibility(visible: true, child: _buildCollectionTitle()),
  //         const SizedBox(height: 10),
  //         Text(
  //           '“别人稍一注意你，你就敞“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你“别人稍一注意你，你开心扉，你觉得这是坦率，其实这是孤独。”',
  //           style: TextStyle(
  //               fontSize: ScreenUtil().setSp(14),
  //               fontWeight: FontWeight.normal,
  //               color: HexColor('#E5E5E3')),
  //         ),
  //         _buildAttentionTopic(),
  //         SizedBox(height: 20.w),
  //         _buildAttentionImages(),
  //         // SizedBox(height: 12.w),
  //         // _buildActivityBottom(),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildBottomInputWidget() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w),
  //     height: 68.w,
  //     child: Flex(direction: Axis.horizontal, children: [
  //       Expanded(
  //         flex: 1,
  //         child: TextField(
  //           style: const TextStyle(
  //             color: Colors.white,
  //           ),
  //           decoration: InputDecoration(
  //             hintText: '留下评论…',
  //             hintStyle: TextStyle(
  //                 color: HexColor('#666462'),
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.normal),
  //             border: OutlineInputBorder(
  //               borderSide: BorderSide.none, // 移除边框
  //               borderRadius: BorderRadius.circular(22),
  //             ),
  //             contentPadding: EdgeInsets.symmetric(vertical: 13.0),
  //           ),
  //         ),
  //       ),
  //       SizedBox(width: 18.w),
  //       _buildHorizontalButton(),
  //       SizedBox(width: 18.w),
  //       _buildHorizontalButton(),
  //     ]),
  //   );
  // }
  //
  // Widget _buildHorizontalButton() {
  //   return Row(
  //     children: [
  //       Image.asset('assets/images/board_info_head.png',
  //           width: 24, height: 24),
  //       SizedBox(width: 4.w),
  //       Text(
  //         '513',
  //         style: TextStyle(
  //             fontSize: ScreenUtil().setSp(14),
  //             fontWeight: FontWeight.normal,
  //             color: AppColor.tabbarItemTitelDefault),
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget _buildCollectionTitle() {
  //   return Container(
  //     //height: 28.w,
  //     padding: EdgeInsets.all(4),
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.all(Radius.circular(9)),
  //         color: HexColor('#292D2E')),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Image.asset(
  //             'assets/images/board_info_head.png', width: 20, height: 20),
  //         SizedBox(width: 2),
  //         Text(
  //           '敦煌古画系列：飞天',
  //           style: TextStyle(
  //               fontSize: ScreenUtil().setSp(12),
  //               fontWeight: FontWeight.normal,
  //               color: HexColor('#F6D5A4')),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildAttentionUserInfo() {
  //   return Container(
  //     height: 57.w,
  //     width: 343.w,
  //     child: Stack(
  //       children: [
  //         Positioned(
  //             top: 18.w,
  //             left: 16.w,
  //             child: ClipOval(
  //                 child: Image.asset(
  //                   'assets/images/board_info_head.png',
  //                   width: 39,
  //                   height: 39,
  //                   fit: BoxFit.cover,
  //                 ))),
  //         Visibility(
  //           visible: true,
  //           child: Positioned(
  //               top: 43.w,
  //               left: 42.w,
  //               child:
  //               Image.asset('assets/images/board_info_head.png', width: 16,
  //                   height: 16)),
  //         ),
  //         Positioned(
  //             top: 21.w,
  //             left: 63.w,
  //             child: Text(
  //               '一只榴莲',
  //               style: TextStyle(
  //                   fontSize: ScreenUtil().setSp(16),
  //                   fontWeight: FontWeight.bold,
  //                   color: HexColor('#E5E5E3')),
  //             )),
  //         Positioned(
  //             top: 21.w,
  //             left: 133.w,
  //             child: Container(
  //               padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
  //               decoration: BoxDecoration(
  //                 gradient: LinearGradient(
  //                   colors: [
  //                     HexColor('#F6D5A4'),
  //                     HexColor('#EDB155'),
  //                   ],
  //                   begin: Alignment(0, 0.5),
  //                   end: Alignment(0.5, 0.5),
  //                   stops: [0.0, 1.0], //[渐变起始点, 渐变结束点]
  //                 ),
  //                 borderRadius: BorderRadius.circular(9),
  //               ),
  //               child: Text(
  //                 '官方',
  //                 style: TextStyle(
  //                     fontSize: ScreenUtil().setSp(10),
  //                     fontWeight: FontWeight.normal,
  //                     color: HexColor('#000000')),
  //               ),
  //             )),
  //         Positioned(
  //             top: 43.w,
  //             left: 67.w,
  //             // width: 100.w,
  //             // height: 12.w,
  //             child: Text(
  //               '2分钟前',
  //               style: TextStyle(
  //                   fontSize: ScreenUtil().setSp(12),
  //                   fontWeight: FontWeight.normal,
  //                   color: HexColor('#999794')),
  //             )),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildAttentionTopic() {
  //   return Wrap(
  //       alignment: WrapAlignment.start, // 控制垂直方向上的对齐方式
  //       spacing: 12,
  //       runSpacing: 2, // 控制每行之间的间距
  //       children: _createTopicTagChips());
  // }
  //
  // Widget _buildAttentionImages() {
  //   return GridView.builder(
  //     itemCount: 6,
  //     shrinkWrap: true,
  //     physics: const NeverScrollableScrollPhysics(),
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 3,
  //       crossAxisSpacing: 6, // 设置水平间距
  //       mainAxisSpacing: 6,
  //       childAspectRatio: 1,
  //       // 设置垂直间距
  //     ),
  //     itemBuilder: (BuildContext context, int index) {
  //       return GestureDetector(
  //           onTap: () {
  //             print("$index");
  //           },
  //           child: Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(12),
  //               color: HexColor('#1D2324'),
  //             ),
  //             child: Image.asset('assets/images/board_info_head.png'),
  //           ));
  //     },
  //   );
  // }
  //
  // Widget _buildActivityBottom() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 12.w),
  //     child: Container(
  //       width: 319.w,
  //       height: 20.w,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           _buildAttionButton(
  //               '赞', 'assets/images/ground_forward_cover@3x.png'),
  //           _buildAttionButton(
  //               '评论', 'assets/images/ground_comment_cover@3x.png'),
  //           _buildAttionButton(
  //               '转发', 'assets/images/ground_comment_cover@3x.png'),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildAttionButton(String text, String iconName) {
  //   return Container(
  //     child: Row(
  //       children: [
  //         Image.asset(iconName, width: 20, height: 20),
  //         SizedBox(width: 4.w),
  //         Text(
  //           text,
  //           style: TextStyle(
  //               fontSize: ScreenUtil().setSp(12),
  //               fontWeight: FontWeight.normal,
  //               color: HexColor('#BFBDBA')),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // List<Widget> _createTopicTagChips() {
  //   final chips = <Widget>[];
  //   ['#闲聊时刻', '#分享日常'].forEach((element) {
  //     final chip = GestureDetector(
  //       child: SizedBox(
  //         height: 12.w,
  //         child: Chip(
  //           label: Text(
  //             element,
  //             style: TextStyle(
  //                 fontSize: ScreenUtil().setSp(12),
  //                 fontWeight: FontWeight.normal,
  //                 color: HexColor('#3B94FD')),
  //           ),
  //           backgroundColor: AppColor.itmebg1,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(0), // 设置圆角
  //           ), // 将背景颜色设置为透明
  //         ),
  //       ),
  //       onTap: () {
  //         print(element);
  //       },
  //     );
  //     chips.add(chip);
  //   });
  //   return chips;
  // }
}
