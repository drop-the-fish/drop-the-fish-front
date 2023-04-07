import 'package:camera/camera.dart';
import 'package:drop_the_fish/widgets/fish_bottom_navigation_bar.dart';
import 'package:drop_the_fish/widgets/camera_screen_tab_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '하위'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late Future<CameraDescription> camera;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(_handleTabSelection);
    camera = _initCamera();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  _handleTabSelection() {
    setState(() {
      _selectedIndex = tabController.index;
    });
  }

  Future<CameraDescription> _initCamera() async {
    // 디바이스에서 이용가능한 카메라 목록을 받아옵니다.
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      throw FlutterError('사용가능한 Camera가 없습니다.');
    }
    return cameras.first;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: _selectedIndex == 0
            ? null
            : AppBar(
                title: Text(widget.title),
                toolbarOpacity: 0,
              ),
        body: Container(
          color: Colors.black,
          child: TabBarView(
            controller: tabController,
            children: [
              FutureBuilder(
                future: camera,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CameraScreenTabWidget(camera: snapshot.data!);
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              Container(),
              Container(),
            ],
          ),
        ),
        bottomNavigationBar:
            FishBottomNavigationBar(tabController: tabController),
      ),
    );
  }
}
