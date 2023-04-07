import 'package:camera/camera.dart';
import 'package:drop_the_fish/screens/fish_capture_screen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreenTabWidget extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreenTabWidget({
    super.key,
    required this.camera,
  });

  @override
  State<CameraScreenTabWidget> createState() => _CameraScreenTabWidgetState();
}

class _CameraScreenTabWidgetState extends State<CameraScreenTabWidget> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // 카메라의 현재 출력물을 보여주기 위해
    // CameraController를 생성합니다.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      // 이용 가능한 카메라 목록에서 특정 카메라를 가져옵니다.
      widget.camera,
      // 적용할 해상도를 지정합니다.
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // 위젯의 생명주기 종료시 컨트롤러 역시 해제시켜줍니다.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // Future가 완료되면, 프리뷰를 보여줍니다.
                return Transform.scale(
                  scaleY: 1.15,
                  child: AspectRatio(
                    aspectRatio: 1 / _controller.value.aspectRatio,
                    child: _controller.buildPreview(),
                  ),
                );
              } else {
                // Otherwise, display a loading indicator.
                // 그렇지 않다면, 진행 표시기를 보여줍니다.
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
      floatingActionButton: Transform.translate(
        offset: const Offset(0, -20),
        child: GestureDetector(
          onTap: () async {
            // try / catch 블럭에서 사진을 촬영합니다. 만약 뭔가 잘못된다면 에러에
            // 대응할 수 있습니다.
            await _onCapturePressed(context);
          },
          child: Stack(
            alignment: Alignment.center,
            children: const [
              Icon(Icons.circle, color: Colors.white38, size: 80),
              Icon(Icons.circle, color: Colors.white, size: 65),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _onCapturePressed(BuildContext context) async {
    try {
      // 카메라 초기화가 완료됐는지 확인합니다.
      await _initializeControllerFuture;

      final path = join(
        // 본 예제에서는 임시 디렉토리에 이미지를 저장합니다. `path_provider`
        // 플러그인을 사용하여 임시 디렉토리를 찾으세요.
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );
      // 사진 촬영을 시도하고 저장되는 경로를 로그로 남깁니다.
      XFile picture = await _controller.takePicture();

      picture.saveTo(path);

      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FishCaptureScreen(imagePath: path),
          ),
        );
      }
    } catch (e) {
      // 만약 에러가 발생하면, 콘솔에 에러 로그를 남깁니다.
      print(e);
    }
  }
}
