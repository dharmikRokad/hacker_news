import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/module/authentication/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(() => controller.isFailed()
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.exclamationmark_triangle_fill,
                    size: 80,
                    color: CupertinoColors.systemYellow,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'We can\'t process further without authenticating. If you '
                    'don\'t added any security services for your phone, '
                    'please add them from settings.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            : Container()),
      ),
    );
  }
}
