// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/components/colors/app_colors.dart';
import 'package:wallpaper_app/views/components/utils/utils.dart';

class CustomAppBar extends StatelessWidget {
  String? word1;
  String? word2;

  CustomAppBar({
    Key? key,
    this.word1,
    this.word2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
          softWrap: true,
          textAlign: TextAlign.center,
          text: TextSpan(
              text: word1,
              style: SafeGoogleFont("Montserrat",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.kUnreadChatBG),
              children: [
                TextSpan(
                    text: word2,
                    style: SafeGoogleFont("Montserrat",
                        fontSize: 17, color: AppColor.kdarkColor)),
              ])),
    );
  }
}
