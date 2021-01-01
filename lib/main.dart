import 'dart:io';

import 'package:adb_tool/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:global_repository/global_repository.dart';
import 'package:provider/provider.dart';

import 'config/config.dart';
import 'config/global.dart';
import 'global/provider/devices_state.dart';
import 'global/provider/process_info.dart';
import 'global/widget/custom_scaffold.dart';
import 'page/adb_install_page.dart';
import 'page/adb_insys_page.dart';
import 'page/exec_cmd_page.dart';
import 'page/home_page.dart';
import 'page/search_ip_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'sarasa',
      ),
      home: AdbTool(),
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );
  Config.init();
}

class AdbTool extends StatefulWidget {
  @override
  _AdbToolState createState() => _AdbToolState();
}

class _AdbToolState extends State<AdbTool> {
  @override
  void initState() {
    super.initState();
  }

  Future<bool> adbExist() async {
    await PlatformUtil.init();
    print(PlatformUtil.environment()['PATH']);
    print("-> ${await PlatformUtil.cmdIsExist('scrcpy')}");
    print("-> ${await PlatformUtil.cmdIsExist('adbc')}");
    print("-> ${await PlatformUtil.cmdIsExist('where')}");
    print("-> ${await PlatformUtil.cmdIsExist('python')}");
    return PlatformUtil.cmdIsExist('adb');
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider<ProcessState>(
          create: (_) => ProcessState(),
        ),
        ChangeNotifierProvider<DevicesState>(
          create: (_) => DevicesState(),
        ),
      ],
      child: FutureBuilder<bool>(
        future: adbExist(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (PlatformUtil.isDesktop()) {
            ScreenUtil.init(
              context,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              allowFontScaling: false,
            );
          } else {
            ScreenUtil.init(
              context,
              width: 414,
              height: 896,
              allowFontScaling: false,
            );
          }
          // return _AdbTool();
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              print('还没有开始网络请求');
              return const Text('');
            case ConnectionState.active:
              return const Text('ConnectionState.active');
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (!snapshot.data) {
                return AdbInstallPage();
              }
              return _AdbTool();
            default:
              return null;
          }
        },
      ),
    );
  }
}

class _AdbTool extends StatefulWidget {
  @override
  __AdbToolState createState() => __AdbToolState();
}

class __AdbToolState extends State<_AdbTool> {
  int currentIndex = 0;
  int pageIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Global.instance.processState = Provider.of<ProcessState>(context);
    return Material(
      child: Scaffold(
        // backgroundColor: Colors.white,
        // floatingActionButton: FloatingActionButton(onPressed: () {
        //   NiProcess.exit();
        // }),
        body: NiScaffold(
          appBar: AppBar(
            brightness: Brightness.light,
            backgroundColor: Color(0xf7f7f7),
            centerTitle: true,
            elevation: 0.0,
            title: Text(
              'ADB 工具',
              style: TextStyle(
                height: 1.0,
                color: Theme.of(context).textTheme.bodyText2.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          drawer: DrawerPage(
            index: pageIndex,
            onChange: (index) {
              pageIndex = index;
              setState(() {});
              if (PlatformUtil.isMobilePhone()) {
                Navigator.pop(context);
              }
            },
          ),
          body: listWidget[pageIndex],
        ),
      ),
    );
  }
}

List<Widget> listWidget = [
  HomePage(),
  AdbInstallToSystemPage(),
  SearchIpPage(),
  ExecCmdPage(),
  ExecCmdPage(),
];
