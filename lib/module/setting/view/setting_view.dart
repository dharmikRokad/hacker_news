import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_news/module/setting/controller/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.black54,
        title: const Text('Settings'),
      ),
      body: ListTile(
        onTap: () {
          _showThemeDialog(context);
        },
        title: const Text(
          'Theme',
        ),
        trailing: Obx(
          () => Text(
            controller.selectedTheme(),
          ),
        ),
      ),
    );
  }

  _showThemeDialog(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => _buildDialog(),
      );

  _buildDialog() => AlertDialog(
        title: const Text('Select a Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildRadioTile('light', 'Light'),
            _buildRadioTile('dark', 'Dark'),
            _buildRadioTile('system', 'System'),
          ],
        ),
        actions: [
          TextButton(onPressed: controller.onOk, child: const Text('Ok')),
        ],
      );

  _buildRadioTile(String value, String title) => Obx(
    () => RadioListTile(
          value: value,
          groupValue: controller.selectedTheme(),
          onChanged: (value) {
            controller.selectedTheme(value.toString());
          },
          title: Text(title),
        ),
  );
}
