import 'package:flutter/material.dart';
import '../res/app_color.dart';
import '../res/image_assets.dart';

class CommonHeader extends StatelessWidget {
  final String title;
  final bool hideBackButton;
  final VoidCallback? onBackPress;

  CommonHeader({
    required this.title,
    this.hideBackButton = false,
    this.onBackPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            if (!hideBackButton)
              IconButton(
                icon: Image.asset(
                  ImageAssets.backButton,
                  width: 24,
                  height: 24,
                ),
                onPressed: onBackPress ?? () {
                  Navigator.of(context).pop();
                },
              ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}