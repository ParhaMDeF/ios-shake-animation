import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:ios_shake_animation/animation_contoller.dart';
import 'app_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ios shake animation',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  var animationManager = Get.put(AnimationManager());

  @override
  void initState() {
    super.initState();
    animationManager.controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  List<String> iconAssets = [
    "assets/setting.png",
    "assets/appstore.png",
    "assets/call.png",
    "assets/spotify.png",
    "assets/safari.png",
    "assets/contacts.png",
    "assets/setting.png",
    "assets/apple_music.png",
    "assets/weather.png",
    "assets/setting.png",
    "assets/appstore.png",
    "assets/call.png",
    "assets/spotify.png",
    "assets/safari.png",
    "assets/contacts.png",
    "assets/setting.png",
    "assets/apple_music.png",
    "assets/weather.png",
    "assets/spotify.png",
    "assets/safari.png",
    "assets/setting.png",
    "assets/appstore.png",
    "assets/call.png",
    "assets/spotify.png",
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          animationManager.stop();
        },
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF00CC),
                Color(0xFF333399),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedBuilder(
                  animation: animationManager.controller,
                  builder: (context, child) => TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                    builder: (context, value, child) => Wrap(
                        runSpacing: 20,
                        spacing: 20,
                        alignment: WrapAlignment.center,
                        children: List.generate(iconAssets.length,
                            (index) => AppWidget(iconAssets[index], value , index))),
                  ),
                ),
              ),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
