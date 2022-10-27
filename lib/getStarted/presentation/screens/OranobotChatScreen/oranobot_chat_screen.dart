import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:tatware/core/utils/decoration_helper.dart';
import 'package:tatware/core/utils/fonts_helper.dart';
import 'package:tatware/core/utils/route.dart';
import 'package:tatware/core/utils/theme/theme.dart';
import 'package:tatware/experts/presentation/screens/home_screen.dart';
import 'package:tatware/getStarted/data/models/chat_item_model.dart';

import 'body/current_user_chat_item.dart';
import 'body/oranobot_chat_item.dart';

class OranobotChatScreen extends StatefulWidget {
  const OranobotChatScreen({Key? key}) : super(key: key);

  @override
  State<OranobotChatScreen> createState() => _OranobotChatScreenState();
}

class _OranobotChatScreenState extends State<OranobotChatScreen> {
  final ScrollController _controller = ScrollController();
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    editingController.clear();
  }

  Future _scrollDown() async {
    editingController.clear();
    await _controller.animateTo(
      _controller.position.maxScrollExtent + 100.h,
      duration: const Duration(milliseconds: 700),
      curve: Curves.fastOutSlowIn,
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 34.h),
            SizedBox(
              height: 764.h,
              child: ListView(
                  // shrinkWrap: true,
                  controller: _controller,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: List.generate(
                    chatList.length,
                    (index) {
                      if (chatList[index].message == 'What Categories you will need expert In?') {
                        return Column(
                          children: [
                            OranobotChatItem(text: chatList[index].message),
                            ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              children: List.generate(
                                chatCategoryItem.length,
                                (index) => Padding(
                                  padding: EdgeInsetsDirectional.only(start: 70.w),
                                  child: GestureDetector(
                                    onTap: () => setState(
                                      () =>
                                          chatCategoryItem[index].active = !chatCategoryItem[index].active,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 20.w,
                                          height: 20.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: chatCategoryItem[index].active ? buttonColor : chatColor,
                                          ),
                                          child: chatCategoryItem[index].active
                                              ? const Center(
                                                  child: Icon(Icons.done, color: Colors.white, size: 12))
                                              : const SizedBox.shrink(),
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          chatCategoryItem[index].text,
                                          style: cairoW300(color: Colors.black, size: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return chatList[index].user == '1'
                          ? OranobotChatItem(text: chatList[index].message)
                          : CurrentUserChatItem(text: chatList[index].message);
                    },
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(0, 0),
                blurRadius: 4.0,
              )
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 46.h,
                  decoration: decorationRadius(color: Color(0xFFF6F7F8)),
                  margin: EdgeInsets.symmetric(horizontal: 14.w),
                  child: TextFormField(
                    controller: editingController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintStyle: cairoW400(color: Color(0xFFB3B3B3)),
                      suffixIcon: Image.asset('assets/icons/voice.png'),
                      prefixIcon: Image.asset('assets/icons/language.png'),
                      contentPadding: EdgeInsetsDirectional.only(
                        top: 3.h,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  chatList.add(
                    ChatItem(message: editingController.text.toString(), user: '2'),
                  );
                  setState(() {});
                  _scrollDown().then((value) => fadNavigate(context, const HomeScreen()));
                },
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: 14.w),
                  child: Image.asset('assets/icons/send.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
