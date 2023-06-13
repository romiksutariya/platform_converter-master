import 'package:flutter/material.dart';
import 'package:platform_converted_app/controllers/providers/app_provider.dart';
import 'package:platform_converted_app/views/components/AddChat.dart';
import 'package:platform_converted_app/views/components/CallsPage.dart';
import 'package:platform_converted_app/views/components/ChatPage.dart';
import 'package:platform_converted_app/views/components/SettingsPage.dart';
import 'package:provider/provider.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Platform Converter",
          style: TextStyle(fontWeight: FontWeight.bold),),
          actions: [
            Switch(
              value: Provider.of<AppProvider>(context).appModel.switchValue,
              onChanged: (val) {
                Provider.of<AppProvider>(context, listen: false).switchUi();
              },
            ),
          ],
          bottom: const TabBar(
            physics: BouncingScrollPhysics(),
            labelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              Icon(Icons.person_add_alt),
              Text("CHATS"),
              Text("CALLS"),
              Text("SETTINGS"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AddChat(),
            ChatPage(),
            CallsPage(),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}
