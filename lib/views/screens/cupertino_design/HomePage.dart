import 'package:flutter/cupertino.dart';
import 'package:platform_converted_app/controllers/providers/app_provider.dart';
import 'package:platform_converted_app/views/components/AddChat.dart';
import 'package:platform_converted_app/views/components/CallsPage.dart';
import 'package:platform_converted_app/views/components/ChatPage.dart';
import 'package:platform_converted_app/views/components/SettingsPage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_add),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: "CHATS",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: "CALLS",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: "SETTINGS",
          ),
        ],
      ),
      tabBuilder: (context, i) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: const Text("Platform Converter",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                trailing: CupertinoSwitch(
                  value: Provider.of<AppProvider>(context).appModel.switchValue,
                  onChanged: (val) {
                    Provider.of<AppProvider>(context, listen: false).switchUi();
                  },
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    IndexedStack(
                      index: i,
                      children: const [
                        AddChat(),
                        ChatPage(),
                        CallsPage(),
                        SettingsPage(),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
